# Dopamine-Reward / GRM (Robo-Dopamine)

| 字段 | 内容 |
| --- | --- |
| **Date** | 2025-12 |
| **Paper** | [Robo-Dopamine: General Process Reward Modeling for High-Precision Robotic Manipulation](https://arxiv.org/abs/2512.23703) |
| **Domain** | Robot+Human / Sim+Real |
| **Modality** | multi-view image, language, BEFORE/AFTER pairs |
| **Size** | **34,601,209 samples**（`json_all`）；3,400+ h / 100k+ trajectories / 350 tasks；HF 图像 ~239 GB + JSON ~6.1 GB |
| **Progress Annotation** | 有 — hop-based relative progress (BEFORE/AFTER) |
| **Failure or Recovery Trajectory** | 有 — 真实/仿真/人类视频混合 |
| **Subtask Annotation** | 有 — step-wise 离散化 |
| **Failure Taxonomy** | 无（hop-based 相对进度，无独立 failure taxonomy） |

## Description

大规模相对进度（GRM）训练数据，通过 BEFORE/AFTER 图像对与 language 描述学习任务进展。适用于 generalist reward model、progress critic 与 long-horizon manipulation。

## Download

- Hugging Face（**gated**，需申请访问）: https://huggingface.co/datasets/tanhuajie2001/Robo-Dopamine-GRM-Dataset

## Notes

- 下载前需在 Hugging Face 页面同意 license 并 request access。
- 体量极大，建议按需 shard 下载或只拉 JSON metadata 做索引。
- 本地镜像：`hf download tanhuajie2001/Robo-Dopamine-GRM-Dataset --repo-type dataset --local-dir .../Dopamine-GRM`
