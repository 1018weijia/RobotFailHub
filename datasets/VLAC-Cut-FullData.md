# VLAC-Cut-FullData

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-06（HF 仓库创建于 2026-06-23；最后核验更新 2026-07-13） |
| **Paper** | HELP: HUMAN-EFFICIENT LARGE-SCALE ROBOTPOST-TRAINING WITH ROLLOUT SEGMENTATION |
| **Domain** | Robot / Real + Sim |
| **Dataset Role** | offline video-progress training/evaluation benchmark + raw-data release |
| **R2 Classification** | R2-C — 离线进度/失败评测数据，不是候选 VLA 的在线真机 rollout dump |
| **Modality** | video / extracted-frame paths, task language, dense progress, semantic-anchor reasoning |
| **Size** | HF `usedStorage` 956,063,943,607 bytes（约 956 GB / 890 GiB）；其中 7 组原始数据归档拆为 22 个文件 |
| **Progress Annotation** | 有 — 帧级 `dense_kinematic_progress` + 锚点级 `human_annotated_progress`；失败后可降为负值 |
| **Failure or Recovery Trajectory** | 有 — `nonexpert` / `bad` 失败轨迹；含文本 `correction_plan`，但未确认有执行纠错后的 recovery action |
| **Subtask Annotation** | 有 — `task_description` 中的阶段/百分比 + `semantic_anchors` |
| **Failure Taxonomy** | 无统一 taxonomy；错误以自由文本 `error_success_analysis` 描述 |
| **License** | HF 标记为 `other`；数据卡未给出具体许可条款 |

## Description

VLAC-Cut-FullData 是 VLAC-Cut 的全量数据发布，用于复现其视频任务进度评测协议。仓库同时提供大体量原始数据归档、原始标注 JSON 树、预生成 benchmark JSON 和按 benchmark 引用定向抽帧的脚本。公开路径覆盖 ARX、DROID、VLABench、LIBERO 等真实与仿真来源。

预生成拆分包括：

- `train`
- `test_expert_seen`
- `test_expert_unseen`
- `test_nonexpert_seen`
- `test_nonexpert_unseen`
- `all`（比标准评测子集更大，由全量原始标注源重建）

## Annotation Schema

每个 episode 的 benchmark 记录包含：

- `metadata`：数据源、任务指令、带阶段百分比的任务描述、帧数、FPS、可用视角与 `is_expert`。
- `frame_index`：各帧/视角的目标路径；路径以 `__VLAC2_FRAMES_ROOT__/` 为占位前缀。
- `dense_kinematic_progress`：逐帧连续进度，成功轨迹通常走向 100；失败轨迹可回落到 0 以下。
- `semantic_anchors`：关键帧上的人工进度、动作/状态描述、进度解释、错误分析与文本纠错计划。

`correction_plan` 是“下一步应如何纠正”的语言标注，不应当被统计为机器人已经执行的恢复轨迹。

## Repository Layout

```text
benchmark_style_all/
  train/video_progress_benchmark_file.json
  test_expert_seen/video_progress_benchmark_file.json
  test_expert_unseen/video_progress_benchmark_file.json
  test_nonexpert_seen/video_progress_benchmark_file.json
  test_nonexpert_unseen/video_progress_benchmark_file.json
  all/video_progress_benchmark_file.json
annotation_files_raw/
data/
  vlac2_release_data_part01_arx_group_a.tar.zst.part-*
  ...
  vlac2_release_data_part07_other_sources.tar.zst
scripts/
  unpack_data.sh
  extract_vlac2_release_frames.py
```

## Download

- Hugging Face Dataset: https://huggingface.co/datasets/InternRobotics/VLAC-Cut-FullData

只下载 README、处理脚本和四个 test split（不下载约 951 GB 的原始归档）：

```bash
hf download InternRobotics/VLAC-Cut-FullData \
  --repo-type dataset \
  --include "README.md" "scripts/*" "benchmark_style_all/test_*/*" \
  --local-dir ../datasets/VLAC-Cut-FullData-eval
```

下载完整发布（约 956 GB，解压还需要额外空间）：

```bash
hf download InternRobotics/VLAC-Cut-FullData \
  --repo-type dataset \
  --local-dir ../datasets/VLAC-Cut-FullData
```

完整下载后解包，并只为指定评测 JSON 抽取所需帧：

```bash
bash ../datasets/VLAC-Cut-FullData/scripts/unpack_data.sh \
  ../datasets/VLAC-Cut-FullData/raw

python ../datasets/VLAC-Cut-FullData/scripts/extract_vlac2_release_frames.py \
  --data-root ../datasets/VLAC-Cut-FullData/raw \
  --frames-root ../datasets/VLAC-Cut-FullData/frames \
  --benchmark-json ../datasets/VLAC-Cut-FullData/benchmark_style_all/test_nonexpert_seen/video_progress_benchmark_file.json
```

## Notes

- `data/` 中 7 个逻辑归档共 22 个文件，合计约 950.7 GB；HF 全仓 `usedStorage` 约 956.1 GB。
- `train` 与 `all` 的 benchmark JSON 本身约为 2.04 GB 和 3.06 GB，不应把“只下载 JSON”理解为轻量操作。
- 标准使用不需要重建 benchmark JSON；抽帧脚本只解码传入 JSON 实际引用的 episode。
- 数据卡没有列出论文链接或具体 license 文本，二者均保留为待核验，避免把 `license: other` 误写为开放许可。
- 抽样检查 `test_nonexpert_seen` 时发现一条 anchor 的 `human_annotated_progress` 为 `-20`，但同条 `progress_explanation` 写为“跌落至10%”；用于训练/评测前应做字段一致性校验。
