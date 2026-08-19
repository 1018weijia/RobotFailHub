# DenseReward

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-07 |
| **Paper** | [DenseReward: Dense Reward Learning via Failure Synthesis for Robotic Manipulation](https://arxiv.org/abs/2607.13033) |
| **Domain** | Robot+Human / Sim+Real |
| **Modality** | video, language instruction, frame-level dense reward |
| **Size** | 27k episodes，756 万帧级标注 |
| **Progress Annotation** | 有 — 帧级 0–1 dense reward |
| **Failure or Recovery Trajectory** | 有 — collision / miss grasp / drop / recover 等合成失败 |
| **Subtask Annotation** | 有 — Reach / Grasp / Lift / Move / Place 五阶段 |
| **Failure Taxonomy** | 有 — failure mode 标注 |

## Description

通过仿真中 targeted perturbation 自动合成物理 realistic 失败轨迹，并标注帧级 dense reward。覆盖 DROID、Isaac Sim、RoboSuite、LIBERO 等多源数据，用于训练 DenseReward 模型及下游 MPC / RL。

## Download

- 项目页: https://dense-reward.github.io/
- 模型（HF）: https://huggingface.co/densereward
  - [`densereward-1frame`](https://huggingface.co/densereward/densereward-1frame)
  - [`densereward-3frame-thinking`](https://huggingface.co/densereward/densereward-3frame-thinking)
- **完整训练数据集**: 待核验 — 论文称将 release dataset；截至 2026-08 尚无独立 HF dataset repo，可关注 [densereward](https://huggingface.co/densereward) org 更新

## Notes

- 与 RoboReward 在 dense reward prediction benchmark 中直接可比。
- 本地镜像：待官方 dataset repo 发布后补充 `hf download` 命令。
