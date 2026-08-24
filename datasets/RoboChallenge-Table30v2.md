# RoboChallenge Table30 v2

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-05（Table30 v2 数据发布） |
| **Paper** | [RoboChallenge: Large-scale Real-robot Evaluation of Embodied Policies](https://arxiv.org/abs/2510.17950) |
| **Domain** | Robot / Real |
| **Dataset Role** | benchmark support / training data |
| **R2 Classification** | R2-B — 真机 benchmark，公开仓库不是候选 policy 的统一 test rollout dump |
| **Modality** | multi-view H.264 video, robot state JSONL, joint/EEF/gripper state, task and episode metadata |
| **Size** | 30 个任务，4 种 embodiment；HF 总文件约 1.01 TB |
| **Progress Annotation** | 有（任务级）— grading points、task score、success rate |
| **Failure or Recovery Trajectory** | 待核验 — 公开仓库定位为训练/benchmark 配套数据，未确认统一失败 rollout 标注 |
| **Subtask Annotation** | 有（评分点）— 部分任务按多个 grading point 计分 |
| **Failure Taxonomy** | 无统一 taxonomy |
| **License** | 待核验 — HF dataset card 未声明统一数据许可 |

## Description

RoboChallenge 是大规模在线真机评测系统；Table30 v2 提供 30 个真实机器人 manipulation tasks，覆盖 ARX5、UR5、ALOHA 与 DOS-W1 四种 embodiment。公开数据仓库按任务存储多机位视频、机器人状态和 episode metadata，并提供转换为 LeRobot 的示例。

公开仓库主要是 benchmark-aligned training/support data；模型的正式测试结果通过 RoboChallenge 真机评测与 leaderboard 产生，因此不能将 1.01 TB 数据整体标作 evaluation rollout。

## Official Sources

- Benchmark: https://robochallenge.ai/
- Table30 v2 dataset: https://huggingface.co/datasets/RoboChallenge/Table30v2
- Technical report: https://robochallenge.ai/robochallenge_techreport_V2.pdf
- Paper: https://arxiv.org/abs/2510.17950

## Download

完整仓库约 1.01 TB，建议按任务选择文件，而不是直接全量下载：

```bash
hf download RoboChallenge/Table30v2 \
  --repo-type dataset \
  --include "arrange_flowers*" \
  --local-dir ../datasets/Table30v2/arrange_flowers
```

## Notes

- 下载前先查看 HF 文件树和具体任务体量。
- 数据卡提供 LeRobot 转换示例，但其他 embodiment 需要自行适配。
- 代码许可、论文许可与数据许可不能互相替代；在官方补充 dataset license 前保持 `待核验`。
