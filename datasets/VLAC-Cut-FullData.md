# VLAC-Cut-FullData

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-07（HELP 论文；HF dataset 创建于 2026-06-23） |
| **Paper** | [HELP: Human-Efficient Large-Scale Robot Post-Training with Rollout Segmentation](https://arxiv.org/abs/2607.09776) |
| **Domain** | Robot / Real + Sim，以真机为主（全量 record 约 96.8% Real、3.2% Sim） |
| **Dataset Role** | VLAC-Cut 进度 critic 的离线过程监督数据 + Video Progress Benchmark（VPB）+ 原始数据归档 |
| **R2 Classification** | R2-C — 以真实机器人数据为主的混合来源离线 benchmark；不是候选 VLA 的在线真机评测 rollout dump |
| **Modality** | video / extracted-frame paths, task language, sparse progress anchors, dense signed progress, optional grounding/action metadata |
| **Size** | HF `usedStorage` 956,063,943,607 bytes（约 956 GB / 890 GiB）；论文全量口径为 35,230 records、26,615 episodes、15,206 task units、464,446 progress points |
| **Progress Annotation** | 有 — 人工稀疏 `human_annotated_progress` + 线性插值得到的帧级 `dense_kinematic_progress`，范围为 -100 到 100 |
| **Failure or Recovery Trajectory** | 成功、失败和恢复行为均有；ARX 明确包含真实执行的失败与恢复；并非每条 `non-expert` 都以失败结束 |
| **Subtask Annotation** | 有 — `task_description` 中的任务阶段/百分比 + `semantic_anchors` |
| **Failure Taxonomy** | 无统一离散 taxonomy；以 `error_success_analysis` 自由文本描述具体错误 |
| **License** | HF 标记为 `other`；数据卡未给出具体许可条款 |

## 核心结论

这个数据集**真机和仿真都有，但以真机数据为绝对主体**。论文中的数据源及全量 record 构成为：

| 来源 | 环境 | Records | 占比 | 主要作用 |
| --- | --- | ---: | ---: | --- |
| ARX-data | 真机 | 17,935 | 50.9% | 定向采集成功、失败、回退和真实恢复行为 |
| DROID | 真机 | 16,181 | 45.9% | 大规模、多任务真实操作视频，主要为成功/近专家演示 |
| LIBERO | 仿真 | 545 | 1.5% | 补充受控任务变化与仿真操作场景 |
| VLABench | 仿真 | 569 | 1.6% | 补充 benchmark 风格任务和仿真覆盖 |
| **合计** | **Real + Sim** | **35,230** | **约 96.8% Real / 3.2% Sim** | 真机为主，仿真为辅 |

这些百分比来自 HELP 论文 Figure 7，因逐项四舍五入总和可能不是精确 100%。论文明确说明，LIBERO 和 VLABench 只是补充来源，不是数据集主体；所有入选视频都按统一的过程级 schema 重新标注，进度标签不是直接沿用源数据集原标签。

## 成功、失败与恢复

该数据集不是纯失败数据，也不是只有“成功 + 失败”而没有恢复。更准确的轨迹构成如下：

| 概念 | 在本数据集中的含义 |
| --- | --- |
| **Expert** | 按标注后的进度曲线定义：相邻 progress point 没有任何下降；它表示单调/近专家进度模式，不严格等同于“最终一定成功” |
| **Non-expert** | 至少出现一次相邻 signed progress 下降；可能包含抓取失败、碰撞、掉落、错误物体交互或放置偏差，也可能随后恢复并最终成功 |
| **Failure / regression** | 动作令任务状态远离目标；进度可停滞、下降，甚至低于初始状态而变成负值 |
| **Executed recovery** | 原始轨迹中实际发生的恢复动作。论文明确展示 ARX 的重抓取、重新对齐和失败后姿态纠正，因此这类恢复确实存在 |
| **Correction plan** | `semantic_anchors` 中“接下来应该怎么纠正”的文本建议；它本身不证明后续恢复动作已经执行 |

因此，不能把 `expert` 直接写成“成功”、把 `non-expert` 直接写成“最终失败”，也不能把每条含 `correction_plan` 的样本都算作恢复轨迹。识别某条轨迹是否真正恢复，应检查失败后的 progress 是否重新上升、后续视频动作以及最终任务状态。

论文还涉及两类容易与公开原始恢复轨迹混淆的数据：

1. **HELP 的 HITL recovery data**：12 台实体机器人后训练流程中，操作者接管错误状态并执行纠正。这是 HELP 实验的数据流，不能直接假定全部包含在 VLAC-Cut-FullData 发布中。
2. **Counterfactual reverse-progress augmentation**：从已有 progress point 对构造“倒放后再向前”的 regression-and-recovery 训练样本。论文明确说明它不需要新增机器人 rollout，因此属于合成训练增强，不是新采集的真实恢复轨迹。

## 数据规模与拆分

论文给出两个不同统计口径：

- **Full annotation inventory**：35,230 records、26,615 episodes、15,206 task units、464,446 progress points，对应全量标注资产。
- **Curated train/evaluation dataset**：28,167 records、22,978 episodes、15,206 task units、375,172 progress points，用于训练及 VPB 评测。

`record` 是单个视频/视角的标注单位；同一次 episode 的不同相机视角可能对应多个 records，因此 record 数不能当作机器人执行次数。

| Split | Records | Tasks | Progress points | Expert / Non-expert | ARX / DROID / Sim |
| --- | ---: | ---: | ---: | ---: | ---: |
| Train | 24,652 | 13,996 | 331,762 | 15,467 / 9,185 | 10,357 / 13,457 / 838 |
| Expert seen | 1,043 | 1,043 | 11,769 | 1,043 / 0 | 356 / 641 / 46 |
| Expert unseen | 1,043 | 1,043 | 12,333 | 1,043 / 0 | 356 / 641 / 46 |
| Non-expert seen | 713 | 713 | 9,458 | 0 / 713 | 540 / 165 / 8 |
| Non-expert unseen | 716 | 716 | 9,850 | 0 / 716 | 540 / 168 / 8 |
| **Curated total** | **28,167** | **15,206** | **375,172** | **17,553 / 10,614** | **12,149 / 15,072 / 946** |

四个 held-out VPB split 合计 3,515 records。`seen/unseen` 按语义 task unit 是否出现在训练指令数据中划分；同一次物理执行的不同视角被分入同一 split，以避免泄漏。

## Annotation Schema

每个 benchmark record 主要包含：

- `metadata`：数据源、任务指令、任务阶段描述、帧数、FPS、可用视角与 `is_expert`。
- `frame_index`：各帧/视角的目标路径；以 `__VLAC2_FRAMES_ROOT__/` 为占位前缀。
- `dense_kinematic_progress`：从稀疏人工锚点线性插值得到的逐帧 signed progress，而不是每帧独立人工打分。
- `semantic_anchors`：关键帧上的人工进度、动作/状态描述、进度解释、成功/失败分析与文本纠错计划。

Signed progress 的语义是：`100` 表示完成，`0` 表示初始状态，负值表示任务状态比初始设置更差。标注点对应语义事件，例如子目标达成、失败、停滞、回退或恢复，而不是固定时间间隔采样。

## 与 HELP / VLAC-Cut 模型的边界

- **VLAC-Cut-FullData** 是原始视频、过程标注和 benchmark JSON 的公开发布。
- **VPB** 是其中严格 held-out 的 3,515-record 离线视频进度评测集。
- **VLAC-Cut 模型 SFT corpus** 不等于这个 HF 仓库本身。论文还把标注数据转换为 4.76M selected samples，并混入 LLaVA-style、RoboReward、RoboVQA、SpatialQA、ProgressLM CoT 等辅助训练数据。
- **HELP 真机后训练实验** 是两名操作者监管 12 台实体机器人的系统实验；论文中的四个下游 manipulation tasks 和 HITL 接管数据不能与 VPB 的 Real + Sim 数据组成混为一谈。

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

## Official Sources

- Paper: https://arxiv.org/abs/2607.09776
- Full dataset: https://huggingface.co/datasets/InternRobotics/VLAC-Cut-FullData
- Benchmark: https://huggingface.co/datasets/InternRobotics/VLAC-Cut-Benchmark
- Model: https://huggingface.co/InternRobotics/VLAC-Cut
- Code: https://github.com/InternRobotics/VLAC-cut

## Download

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
- `train` 与 `all` 的 benchmark JSON 本身约为 2.04 GB 和 3.06 GB；只下载 JSON 也不一定轻量。
- 标准使用不需要重建 benchmark JSON；抽帧脚本只解码传入 JSON 实际引用的 episode。
- 数据卡的 license 仅标为 `other`，使用前仍需向发布方核实具体许可范围。
- 抽样检查 `test_nonexpert_seen` 时发现一条 anchor 的 `human_annotated_progress` 为 `-20`，但同条 `progress_explanation` 写为“跌落至10%”；用于训练/评测前应做字段一致性校验。
