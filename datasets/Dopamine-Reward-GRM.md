# Dopamine-Reward / GRM (Robo-Dopamine)

| 字段 | 内容 |
| --- | --- |
| **Date** | 2025-12 |
| **Paper** | Robo-Dopamine / GRM relative progress（待核验完整标题） |
| **Domain** | Robot+Human / Sim+Real |
| **Modality** | multi-view image, language, BEFORE/AFTER pairs |
| **Size** | ~35M samples，3400+ 小时视频；HF 约 239 GB 图像 + 6.1 GB JSON |
| **Progress Annotation** | 有 — hop-based relative progress (BEFORE/AFTER) |
| **Failure or Recovery Trajectory** | 有 — 真实/仿真/人类视频混合 |
| **Subtask Annotation** | 有 — step-wise 离散化 |
| **Failure Taxonomy** | 待核验 |

## Description

大规模相对进度（GRM）训练数据，通过 BEFORE/AFTER 图像对与 language 描述学习任务进展。适用于 generalist reward model、progress critic 与 long-horizon manipulation。

## Download

- Hugging Face（**gated**，需申请访问）: https://huggingface.co/datasets/tanhuajie2001/Robo-Dopamine-GRM-Dataset

## Notes

- 下载前需在 Hugging Face 页面同意 license 并 request access。
- 体量极大，建议按需 shard 下载或只拉 JSON metadata 做索引。
- 本地镜像：`hf download tanhuajie2001/Robo-Dopamine-GRM-Dataset --repo-type dataset --local-dir .../Dopamine-GRM`
