# PRIMO-R1

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-03 |
| **Paper** | [From Passive Observer to Active Critic: RL Elicits Process Reasoning for Robotic Manipulation](https://arxiv.org/abs/2603.15600) |
| **Domain** | Robot / Real + Sim |
| **Modality** | video, initial/current frame, language, CoT progress (1–100) |
| **Size** | Bench 23.7k；SFT 116.8k；RL 328.5k（HF 标注行数） |
| **Progress Annotation** | 有 — 细粒度数值 progress + CoT |
| **Failure or Recovery Trajectory** | 有 — 含失败检测与 OOD 真实人形场景 |
| **Subtask Annotation** | 待核验 |
| **Failure Taxonomy** | 无（RoboFail 为独立 benchmark） |

## Description

PRIMO R1（Process Reasoning Induced Monitoring）将 video MLLM 训练为 active critic，通过 outcome-based RL 激励 CoT 进度估计。数据覆盖 AgiBot 真实环境、BEHAVIOR-1k、RoboTwin 仿真，以及 **real-humanoid-ood** 评测子集（4791 条，最接近真实人形部署场景）。

## Download

- HF Collection: https://huggingface.co/collections/LeonOverload/primo-r1
- 模型: https://huggingface.co/LeonOverload/PRIMO-R1-7B
- Benchmark JSON（仅标注）: https://huggingface.co/datasets/LeonOverload/primo-bench-json
- 媒体（视频/帧）: https://huggingface.co/datasets/LeonOverload/primo-video-media
- SFT CoT 数据: https://huggingface.co/datasets/LeonOverload/primo-sft-json
- RL 数据: https://huggingface.co/datasets/LeonOverload/primo-rl-json
- 项目页: https://10-oasis-01.github.io/primo-r1-website/

## Benchmark Subsets

| Subset | Rows | 说明 |
| --- | ---: | --- |
| `real-humanoid-ood` | 4,791 | 真实人形 OOD，G1 dense reward 迁移首选 |
| `agibot-id` / `agibot-ood` | 3,000 / 3,000 | AgiBot 域内/域外 |
| `behavior-1k-id` / `behavior-1k-ood` | 3,999 / 3,000 | BEHAVIOR-1k |
| `robotwin-id` / `robotwin-ood` | 3,000 / 2,914 | RoboTwin 仿真 |

## Notes

- `primo-bench-json` 不含媒体，需配合 `primo-video-media` 本地解压。
- Bench / media 本地放置建议：`../datasets/PRIMO-R1/{primo-bench-json,primo-video-media}/`
