# RoboReward

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-01 |
| **Paper** | [RoboReward: General-Purpose Vision-Language Reward Models for Robotics](https://arxiv.org/abs/2601.00675) |
| **Domain** | Robot / Real |
| **Modality** | video, language, discrete episode-level reward (1–5) |
| **Size** | **54,135 examples**（45,072 train / 6,232 val / 2,831 test RoboRewardBench） |
| **Progress Annotation** | 有 — episode 级 1–5 进度分 |
| **Failure or Recovery Trajectory** | 有 — 负例/近失合成 + RoboArena 真实失败 |
| **Subtask Annotation** | 无 |
| **Failure Taxonomy** | 无 |

## Description

大规模真实机器人 rollout 进度评分数据集，用于训练 vision-language robotic reward model。RoboRewardBench 提供标准化评测协议，与 DenseReward、Dopamine-GRM 等在同一 progress prediction 任务上可比。

## Download

- Hugging Face Dataset: https://huggingface.co/datasets/teetone/RoboReward
- Benchmark: https://crfm.stanford.edu/helm/robo-reward-bench/
- Models: https://huggingface.co/teetone（RoboReward-4B/8B 等待核验）

## Notes

- 离散 1–5 分可映射为 coarse progress；与帧级 dense reward 数据集互补。
- 本地镜像：`hf download teetone/RoboReward --repo-type dataset --local-dir .../RoboReward`
