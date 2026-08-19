# RobotFailHub

<<<<<<< HEAD
一个持续更新的具身智能数据集索引，重点收集带有进度标注、失败轨迹、失败恢复轨迹和子任务标注的数据，用于失败检测、进度估计、强化学习奖励设计的长时程任务分解研究。

## 数据集清单

| Dataset | Date | Description | Domain | Modality | Size| Progress Annotation | Failure or Recovery Trajectory | Subtask Annotation | Failure Taxonomy | Download Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 名称 | 发布时间 | 覆盖的机器人类型和任务种类 | Robot/Human + Real/Sim | obs+state+action | GB | 有无 | 只有失败还是包含恢复动作 | 有无 | 有无 | 下载链接 |

=======
一个持续更新的具身智能数据集索引，重点收集带有**进度标注**、**失败轨迹**、**失败恢复轨迹**和**子任务标注**的数据，用于失败检测、进度估计、强化学习奖励设计的长时程任务分解研究。

> 维护说明：本仓库**只收录数据集元信息与下载入口**，不托管原始视频/轨迹大文件。体量字段优先引用官方发布页；无法核实的字段标注为 `待核验`。

## 数据集清单

| Dataset | Date | Description | Domain | Modality | Size | Progress Annotation | Failure or Recovery Trajectory | Subtask Annotation | Failure Taxonomy | Download Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [Robo-ValueRL](datasets/Robo-ValueRL.md) | 2026-07 | 240h 离线 + 3k+ 在线 rollout；芯片插入、积木拆解；LeRobot v2.1 + value/quality | Robot / Real | video + state + action + language | 待核验 | 有（remain_time / quality） | 有（成功/次优/纠正/失败混合） | 无 | 无 | [HF](https://huggingface.co/datasets/X-Humanoid/Robo-ValueRL) · [GitHub](https://github.com/Open-X-Humanoid/Robo-ValueRL) |
| [DenseReward](datasets/DenseReward.md) | 2026-07 | 27k episode、756 万帧 dense reward；仿真失败合成 | Robot+Human / Sim+Real | video + language + dense reward | 待核验（27k episodes） | 有（帧级 0–1） | 有（collision/miss/fall/recover） | 有（五阶段 manipulation） | 有 | [Project](https://dense-reward.github.io/) · [Models HF](https://huggingface.co/densereward) |
| [RoboReward](datasets/RoboReward.md) | 2026-01 | 4.5 万+ 真实机器人 rollout 进度评分；含 RoboRewardBench | Robot / Real | video + language + discrete reward | 待核验（54k examples） | 有（episode 级 1–5 分） | 有（负例/近失合成 + RoboArena 真实失败） | 无 | 无 | [HF Dataset](https://huggingface.co/datasets/teetone/RoboReward) · [Bench](https://crfm.stanford.edu/helm/robo-reward-bench/) |
| [Dopamine-Reward / GRM](datasets/Dopamine-Reward-GRM.md) | 2025-12 | 3460 万样本、3400+ 小时；BEFORE/AFTER 相对进度 | Robot+Human / Sim+Real | multi-view image + language | ~239 GB（图像）+ 6.1 GB（JSON） | 有（hop-based relative progress） | 有（真实/仿真/人类视频混合） | 有（step-wise 离散化） | 待核验 | [HF Dataset (gated)](https://huggingface.co/datasets/tanhuajie2001/Robo-Dopamine-GRM-Dataset) |
| [RoboArena](datasets/RoboArena.md) | 2025-06 | 分布式真实机器人策略评测；4284+ evaluation episodes | Robot / Real | video + proprio + preference | 21.7 GB（2026-07-17 snapshot） | 有（task-success score） | 有（policy rollout 含成败） | 无 | 无 | [HF DataDump](https://huggingface.co/datasets/RoboArena/DataDump_07-17-2026) · [Website](https://robo-arena.github.io/) |

### 字段说明

| 列名 | 含义 |
| --- | --- |
| Dataset | 数据集名称（详情见 `datasets/` 下卡片） |
| Date | 论文/官方发布年月 |
| Description | 覆盖的机器人类型、任务与标注特点 |
| Domain | Robot/Human + Real/Sim |
| Modality | 观测/状态/动作/语言等 |
| Size | 官方体量或 snapshot 大小 |
| Progress Annotation | 是否有进度/价值/dense reward 标注 |
| Failure or Recovery Trajectory | 仅失败，或含恢复/混合质量轨迹 |
| Subtask Annotation | 是否有子任务/阶段标注 |
| Failure Taxonomy | 是否有失败类型 taxonomy |
| Download Link | 官方下载入口 |

## 本地整理（100.74.87.113）

如需在本机镜像 HF 数据集，建议统一放到：

```text
/mnt/data/yangky/datasets/robot_fail_hub/
```

示例（需先 `huggingface-cli login`）：

```bash
hf download X-Humanoid/Robo-ValueRL --repo-type dataset --local-dir /mnt/data/yangky/datasets/robot_fail_hub/Robo-ValueRL
hf download teetone/RoboReward --repo-type dataset --local-dir /mnt/data/yangky/datasets/robot_fail_hub/RoboReward
hf download RoboArena/DataDump_07-17-2026 --repo-type dataset --local-dir /mnt/data/yangky/datasets/robot_fail_hub/RoboArena
# Dopamine 为 gated dataset，需先在 HF 申请访问
hf download tanhuajie2001/Robo-Dopamine-GRM-Dataset --repo-type dataset --local-dir /mnt/data/yangky/datasets/robot_fail_hub/Dopamine-GRM
```
>>>>>>> 369d325 (Add reward/progress dataset index for Robo-ValueRL, DenseReward, RoboReward, Dopamine-GRM, and RoboArena.)

## 贡献与维护

- 不确定的信息使用 `待核验` 或 `未知`。
<<<<<<< HEAD
=======
- 新增数据集：在 `datasets/` 添加卡片，并更新上表一行。
- 优先链接 **论文 / 项目页 / Hugging Face / GitHub**，避免只放二级转载。
>>>>>>> 369d325 (Add reward/progress dataset index for Robo-ValueRL, DenseReward, RoboReward, Dopamine-GRM, and RoboArena.)
