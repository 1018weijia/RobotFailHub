# VLA-REPLICA

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-05 |
| **Paper** | [VLA-REPLICA: A Low-Cost, Reproducible Benchmark for Real-World Evaluation of Vision-Language-Action Models](https://arxiv.org/abs/2605.20774) |
| **Domain** | Robot / Real |
| **Dataset Role** | benchmark-aligned demonstration + reference scene |
| **R2 Classification** | R2-B — 真机 benchmark，需要在 SO-101 硬件上生成 test rollout |
| **Modality** | top/wrist RGB, LeRobot-compatible state/action, language, reference scene images |
| **Size** | 10 个任务；每任务 50 条 demonstration（共 500 条）；90 张 ID/OOD test-scene references；HF 文件约 1.97 GB |
| **Progress Annotation** | 无；使用任务特定的二元成功条件 |
| **Failure or Recovery Trajectory** | 无公开统一 test rollout dump；评测脚本要求操作者记录成功/失败行为 |
| **Subtask Annotation** | 无统一 subtask 标注 |
| **Failure Taxonomy** | 无 |
| **License** | 数据 CC BY 4.0；代码 MIT |

## Description

VLA-REPLICA 是基于 SO-101、固定工作区、顶视与腕部相机的低成本可复现实机 VLA benchmark。官方提供 10 个 manipulation tasks、500 条适配 demonstrations 和 90 张测试场景参考图，用于在不同实验室复现 ID/OOD 真机评测。

Hugging Face viewer 显示的 22 rows 是自动转换后的展示单元，不是 robot episode 总数；demonstration 总量应以项目页“每任务 50 条、共 500 条”为准。

## Evaluation Protocol

- 每个 task variant 运行 5 次。
- 每次最长 90 秒。
- ID：10 个任务 × 5 variants，共 50 次。
- OOD：8 个任务 × 5 variants，共 40 次。
- 成功条件按任务定义，例如堆叠需稳定接触超过 2 秒、烤箱门需保持打开超过 2 秒。

## Official Sources

- Project: https://irvlutd.github.io/VLAReplica/
- Dataset: https://huggingface.co/datasets/HenryZhang/VLAReplica_SFT_data
- Code and reference scenes: https://github.com/IRVLUTD/VLAReplica
- Paper: https://arxiv.org/abs/2605.20774

## Download

```bash
hf download HenryZhang/VLAReplica_SFT_data \
  --repo-type dataset \
  --local-dir ../datasets/VLA-REPLICA/SFT-data
```

## Notes

- 公开下载的是训练/适配 demonstrations 与场景 references，不是 candidate policy 的 test rollout 集合。
- 最适合用于搭建可重复的本地真机评测并主动采集新的失败/接管数据。
