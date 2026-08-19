# RoboArena

| 字段 | 内容 |
| --- | --- |
| **Date** | 2025-06（DataDump 2026-07-17） |
| **Paper** | RoboArena: Distributed Real-World Robot Policy Evaluation |
| **Domain** | Robot / Real |
| **Modality** | video, proprioception, pairwise preference / task-success score |
| **Size** | 4284+ evaluation episodes；HF snapshot 21.7 GB |
| **Progress Annotation** | 有 — task-success score |
| **Failure or Recovery Trajectory** | 有 — 多策略 rollout 含成败 |
| **Subtask Annotation** | 无 |
| **Failure Taxonomy** | 无 |

## Description

分布式真实机器人策略评测平台与数据 dump，基于 DROID 等平台收集多策略 evaluation rollouts，含 pairwise 比较与 success 标注。RoboReward 等 reward model 训练亦引用其真实失败样本。

## Download

- Hugging Face DataDump: https://huggingface.co/datasets/RoboArena/DataDump_07-17-2026
- Website: https://robo-arena.github.io/

## Notes

- DataDump 为 periodic snapshot，后续可能有更新版本。
- 本地镜像：`hf download RoboArena/DataDump_07-17-2026 --repo-type dataset --local-dir .../RoboArena`
