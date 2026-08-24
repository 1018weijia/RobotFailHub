# TriFinger RL Datasets

| 字段 | 内容 |
| --- | --- |
| **Date** | 2023-05（修正版数据发布） |
| **Paper** | [Benchmarking Offline Reinforcement Learning on Real-Robot Hardware](https://openreview.net/forum?id=3k5CUGDLNdd) |
| **Domain** | Robot / Real + Sim（本卡重点为 `real` variants） |
| **Dataset Role** | real-robot offline RL benchmark dataset |
| **R2 Classification** | R2-C — 真实机器人 offline benchmark |
| **Modality** | Zarr state/action/reward/timeout/terminal；可选三相机 RGB |
| **Size** | 超过 100 小时；Push 每个完整集约 288 万 transitions，Lift 每个完整集约 360 万 transitions；图像版单集约 46–100 GB |
| **Progress Annotation** | 有 — dense/sparse reward、return、success metrics |
| **Failure or Recovery Trajectory** | 有 suboptimal behavior — expert、weak-and-expert、half-expert、mixed policy proficiency；无显式 recovery 标签 |
| **Subtask Annotation** | 无 |
| **Failure Taxonomy** | 无 |
| **License** | 数据 CC BY 4.0；代码 BSD-3-Clause |

## Description

TriFinger RL Datasets 提供真实与仿真 TriFingerPro 上的 Push 和 Lift 数据，面向 offline reinforcement learning、imitation learning、dynamics learning 与 representation learning。真实版本包含不同质量 behavior policy 采集的 transitions，并提供带/不带相机图像的 Zarr 变体。

这是一套真实机器人 offline benchmark，而不是现代 language-conditioned VLA 在线评测。weak/mixed 数据包含次优行为，但官方没有为每条 trajectory 提供统一 failure taxonomy 或 recovery 标签。

## Dataset Families

- Task: `push` / `lift`
- Source: `real` / `sim`
- Quality: `expert` / `smooth-expert` / `weak-n-expert` / `half-expert` / `mixed`
- Image variant: 名称包含 `-image`

命名格式：

```text
trifinger-cube-<task>-<sim/real>-<dataset_type>[-image]-v0.zarr
```

## Official Sources

- Documentation: https://webdav.tuebingen.mpg.de/trifinger-rl/docs/datasets/index.html
- Data repository: https://doi.org/10.17617/3.DXZ7TL
- Loader: https://github.com/rr-learning/trifinger_rl_datasets
- Paper: https://openreview.net/forum?id=3k5CUGDLNdd

## Download

安装 loader 后，首次调用会按需下载到 `~/.trifinger_rl_datasets`：

```bash
pip install trifinger_rl_datasets
```

```python
import gymnasium as gym
import trifinger_rl_datasets

env = gym.make("trifinger-cube-push-real-expert-v0")
dataset = env.get_dataset()
```

## Notes

- 2023-05-15 之前部分 weak/half-expert 与 lift-sim 数据存在错误；应使用官方修正版。
- 图像版比 state-only 版大一个数量级以上，建议先下载 state-only variant。
