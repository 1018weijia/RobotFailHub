# REBOOT (REBOOT26 Recovery Trajectories)

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-05（HF 更新时间） |
| **Paper** | 待核验 — 非 CoRL 2023 dexterous RL 论文 [REBOOT (2309.03322)](https://arxiv.org/abs/2309.03322) |
| **Domain** | Robot / Real |
| **Modality** | video + proprio + action（LeRobot v3.0） |
| **Size** | 38 个 task 级 dataset（HF org）；单 task 约 18–60 episodes |
| **Progress Annotation** | 无 |
| **Failure or Recovery Trajectory** | 有 — 含 `*_recovery_*` 恢复/纠正轨迹 |
| **Subtask Annotation** | 无 |
| **Failure Taxonomy** | 无 |

## Description

[Hugging Face REBOOT26](https://huggingface.co/REBOOT26) 组织发布的双臂 WidowX 操作数据，LeRobot v3.0 格式。任务命名区分 **install / remove / recovery** 等阶段，其中 recovery 子集记录失败后的人工恢复与继续执行，适用于 failure recovery imitation / HIL 微调研究。

> **命名消歧：** 机器人社区另有 CoRL 2023「REBOOT: Reuse Data for Bootstrapping Dexterous Manipulation」，侧重 RL replay buffer 引导，与本 Hub 条目的 recovery 轨迹数据不同。

## Example Datasets

- https://huggingface.co/datasets/REBOOT26/sample_recovery-demonstration
- https://huggingface.co/datasets/REBOOT26/16mm-bar_recovery_remove
- https://huggingface.co/datasets/REBOOT26/nema1-15-plug_remove
- 完整列表: https://huggingface.co/REBOOT26/datasets

## Download

```bash
hf download REBOOT26/sample_recovery-demonstration --repo-type dataset \
  --local-dir /mnt/data/yangky/datasets/robot_fail_hub/REBOOT/sample_recovery-demonstration
```

## Notes

- Robot type: `bi_widowxai_follower_robot`
- 与 LeRobot HIL / RaC 风格的 recovery-correction 数据收集协议相近，但为独立发布
