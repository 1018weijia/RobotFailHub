# Robo-ValueRL

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-07 |
| **Paper** | [Robo-ValueRL: Reliable Value Estimation for Offline-to-Online RL](https://arxiv.org/abs/2607.09866) |
| **Domain** | Robot / Real |
| **Modality** | video, proprioception, action, language instruction |
| **Size** | 240+ 小时离线 + 3000+ 在线 rollout（官方描述）；HF 视图约 79k+ 条 |
| **Progress Annotation** | 有 — remain_time / value-derived quality labels |
| **Failure or Recovery Trajectory** | 有 — 成功、次优、纠正、失败混合 |
| **Subtask Annotation** | 无 |
| **Failure Taxonomy** | 无 |

## Description

X-Humanoid 发布的真实机器人 value-guided RL 数据集，覆盖芯片插入、积木拆解等长时程操作。数据以 LeRobot v2.1 格式组织，包含离线演示与在线策略 rollout，并附带 value/quality 标注，可用于 progress critic、dense reward 与 failure-aware policy learning。

## Tasks

- 芯片插入（chip insertion）
- 积木拆解（block disassembly）

## Download

- Hugging Face: https://huggingface.co/datasets/X-Humanoid/Robo-ValueRL
- GitHub: https://github.com/Open-X-Humanoid/Robo-ValueRL
- Project: https://gewu-lab.github.io/Robo-ValueRL/

## Notes

- 与 DenseReward、RoboReward 同属 2026 年 dense/progress reward 方向高优先级数据集。
- 本地镜像建议路径：`../datasets/Robo-ValueRL`
