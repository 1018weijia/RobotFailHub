# RoboArena

| 字段 | 内容 |
| --- | --- |
| **Date** | 2025-06（DataDump 2026-07-17） |
| **Paper** | [RoboArena: Distributed Real-World Evaluation of Generalist Robot Policies](https://arxiv.org/abs/2506.18123) |
| **Domain** | Robot / Real |
| **Dataset Role** | evaluation rollout |
| **R2 Classification** | R2-A — 已公开真实 policy evaluation artifacts |
| **Modality** | multi-view video, proprioception/action NPZ, session YAML, preference, task-success, long-form feedback |
| **Size** | 3,883 evaluation sessions；10,783 policy episodes；27,148 MP4；10,783 NPZ；21.7 GB |
| **Progress Annotation** | 有 — task-success score |
| **Failure or Recovery Trajectory** | 有 — 多策略 rollout 含成败 |
| **Subtask Annotation** | 无 |
| **Failure Taxonomy** | 无 |
| **License** | MIT |

## Description

分布式真实机器人策略评测平台与数据 dump，基于 DROID robot platform 收集双盲、多策略 evaluation rollouts，含 pairwise preference、task-success、长文本 evaluator feedback 和动作/本体状态。RoboReward 等 reward model 训练亦引用其真实失败样本。

## Download

- Hugging Face DataDump: https://huggingface.co/datasets/RoboArena/DataDump_07-17-2026
- Website: https://robo-arena.github.io/
- Paper: https://arxiv.org/abs/2506.18123

## Notes

- DataDump 为 periodic snapshot，后续可能有更新版本。
- 2026-07-17 snapshot 的 `metadata.yaml` 保存 instruction、preference、feedback、时间戳与各 policy outcome；`global_metadata.yaml` 保存聚合统计与 policy index。
- preference/failure-rich rollout 不等于带人工 corrective takeover action 的数据。
- 本地镜像：`hf download RoboArena/DataDump_07-17-2026 --repo-type dataset --local-dir .../RoboArena`
