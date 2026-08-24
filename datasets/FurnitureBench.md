# FurnitureBench

| 字段 | 内容 |
| --- | --- |
| **Date** | 2023-05 |
| **Paper** | [FurnitureBench: Reproducible Real-World Benchmark for Long-Horizon Complex Manipulation](https://arxiv.org/abs/2305.12821) |
| **Domain** | Robot / Real（另有 FurnitureSim） |
| **Dataset Role** | benchmark-aligned successful demonstration |
| **R2 Classification** | R2-B — 真机 benchmark，公开数据主要是 demonstrations |
| **Modality** | wrist/front RGB, EEF pose/velocity, joints, torque, gripper, 8-D action, reward, skill flags |
| **Size** | 5,100 条成功 demonstrations，219.6 小时；raw PKL 合计约 1,179 GB |
| **Progress Annotation** | 有 — assembly reward 与 skill-completion flags |
| **Failure or Recovery Trajectory** | 无 — 官方公开清单描述为成功 demonstrations |
| **Subtask Annotation** | 有 — skill completion flags |
| **Failure Taxonomy** | 无 |
| **License** | 数据许可待核验；不可由代码仓库许可推断 |

## Description

FurnitureBench 是真实机器人长时程家具装配 benchmark，包含 9 类 3D 打印家具和 low / medium / high 三档初始化随机性。公开数据为 Oculus Quest 2 与键盘遥操作采集的成功 demonstrations，适合 imitation learning、offline RL、长时程进度和 skill boundary 研究。

每个 PKL trajectory 保存 wrist/front RGB、机器人状态、8-D action、assembly reward 和 skill completion flags。真正的候选 policy 评测需要物理 Franka setup，不能把 demonstration corpus 标作 test rollout。

## Official Sources

- Project: https://clvrai.github.io/furniture-bench/
- Dataset documentation: https://clvrai.github.io/furniture-bench/docs/tutorials/dataset.html
- Code: https://github.com/clvrai/furniture-bench
- Paper: https://arxiv.org/abs/2305.12821

## Download

```bash
python furniture_bench/scripts/download_dataset.py \
  --untar \
  --randomness low \
  --furniture lamp \
  --out_dir ../datasets/FurnitureBench
```

## Notes

- raw PKL 体量：low 457 GB、medium 499 GB、high 223 GB。
- Google Drive quota 受限时，官方文档提供 rclone 下载方案。
- 建议按 furniture 与 randomness 选择性下载。
