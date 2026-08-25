# RobotFailHub

一个持续更新的具身智能数据集索引，重点收集带有**进度标注**、**失败轨迹**、**失败恢复轨迹**和**子任务标注**的数据，用于失败检测、进度估计、强化学习奖励设计的长时程任务分解研究。

> 维护说明：本仓库**只收录数据集元信息与下载入口**，不托管原始视频/轨迹大文件。体量字段优先引用官方发布页；无法核实的字段标注为 `待核验`。

## 数据集清单

| Dataset | Date | Description | Domain | Modality | Size | Progress Annotation | Failure or Recovery Trajectory | Subtask Annotation | Failure Taxonomy | Download Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
<<<<<<< HEAD
| [Robo-ValueRL](datasets/Robo-ValueRL.md) | 2026-07 | 240h 离线 + 3k+ 在线 rollout；芯片插入、积木拆解；LeRobot v2.1 + value/quality | Robot / Real | video + state + action + language | 待核验 | 有（remain_time / quality） | 有（成功/次优/纠正/失败混合） | 无 | 无 | [HF](https://huggingface.co/datasets/X-Humanoid/Robo-ValueRL) · [GitHub](https://github.com/Open-X-Humanoid/Robo-ValueRL) |
| [DenseReward](datasets/DenseReward.md) | 2026-07 | 27k episode、756 万帧 dense reward；仿真失败合成 | Robot+Human / Sim+Real | video + language + dense reward | 待核验（27k episodes） | 有（帧级 0–1） | 有（collision/miss/fall/recover） | 有（五阶段 manipulation） | 有 | [Project](https://dense-reward.github.io/) · [Models HF](https://huggingface.co/densereward) |
| [VLAC-Cut-FullData](datasets/VLAC-Cut-FullData.md) | 2026-07 | 35,230 条进度标注 record；ARX + DROID 真机为主，LIBERO + VLABench 仿真为辅 | Robot / Real + Sim（96.8% / 3.2%） | video/frame path + language + signed progress | ~956 GB；35,230 records | 有（稀疏人工锚点 + 插值帧级 signed progress） | 成功、失败、恢复均有；ARX 含真实执行恢复；`non-expert` 仅表示发生过进度回退，不等于最终失败 | 有（任务阶段 + semantic anchors） | 无统一 taxonomy；有自由文本错误分析 | [HF](https://huggingface.co/datasets/InternRobotics/VLAC-Cut-FullData) · [Paper](https://arxiv.org/abs/2607.09776) |
| [RoboReward](datasets/RoboReward.md) | 2026-01 | 4.5 万+ 真实机器人 rollout 进度评分；含 RoboRewardBench | Robot / Real | video + language + discrete reward | 待核验（54k examples） | 有（episode 级 1–5 分） | 有（负例/近失合成 + RoboArena 真实失败） | 无 | 无 | [HF Dataset](https://huggingface.co/datasets/teetone/RoboReward) · [Bench](https://crfm.stanford.edu/helm/robo-reward-bench/) |
| [Dopamine-Reward / GRM](datasets/Dopamine-Reward-GRM.md) | 2025-12 | 3460 万样本、3400+ 小时；BEFORE/AFTER 相对进度 | Robot+Human / Sim+Real | multi-view image + language | ~239 GB（图像）+ 6.1 GB（JSON） | 有（hop-based relative progress） | 有（真实/仿真/人类视频混合） | 有（step-wise 离散化） | 待核验 | [HF Dataset (gated)](https://huggingface.co/datasets/tanhuajie2001/Robo-Dopamine-GRM-Dataset) |
=======
| [Robo-ValueRL](datasets/Robo-ValueRL.md) | 2026-07 | 240h 离线 + 3k+ 在线 rollout；芯片插入、积木拆解；LeRobot v2.1 + value/quality | Robot / Real | video + state + action + language | 79.4k rows / 431 GB | 有（remain_time / quality） | 有（成功/次优/纠正/失败混合） | 无 | 无 | [HF](https://huggingface.co/datasets/X-Humanoid/Robo-ValueRL) · [GitHub](https://github.com/Open-X-Humanoid/Robo-ValueRL) |
| [DenseReward](datasets/DenseReward.md) | 2026-07 | 26.6k episode、756 万帧 dense reward；仿真失败合成 | Robot+Human / Sim+Real | video + language + dense reward | 26,579 episodes / 7.56M frames | 有（帧级 0–1） | 有（collision/miss/fall/recover） | 有（五阶段 manipulation） | 有 | [Project](https://dense-reward.github.io/) · [Models HF](https://huggingface.co/densereward) |
| [VLAC-Cut-FullData](datasets/VLAC-Cut-FullData.md) | 2026-06 | VLAC-Cut 全量发布；expert/nonexpert × seen/unseen 评测拆分 | Robot / Real + Sim | video/frame path + language + dense progress | ~956 GB（HF usedStorage） | 有（帧级 dense progress + semantic anchors） | 有（nonexpert/bad 失败；文本 correction plan，无执行恢复） | 有（阶段描述 + semantic anchors） | 无统一 taxonomy | [HF](https://huggingface.co/datasets/InternRobotics/VLAC-Cut-FullData) |
| [RoboReward](datasets/RoboReward.md) | 2026-01 | 4.5 万 train + RoboRewardBench；episode 级 1–5 进度分 | Robot / Real | video + language + discrete reward | 54,135 examples（45,072 train） | 有（episode 级 1–5 分） | 有（负例/近失合成 + RoboArena 真实失败） | 无 | 无 | [HF Dataset](https://huggingface.co/datasets/teetone/RoboReward) · [Bench](https://crfm.stanford.edu/helm/robo-reward-bench/) |
| [Dopamine-Reward / GRM](datasets/Dopamine-Reward-GRM.md) | 2025-12 | 34.6M 样本、3400+ h、100k+ 轨迹；BEFORE/AFTER 相对进度 | Robot+Human / Sim+Real | multi-view image + language | 34.6M samples（json_all）；~239 GB 图像 + 6.1 GB JSON | 有（hop-based relative progress） | 有（真实/仿真/人类视频混合） | 有（step-wise 离散化） | 无 | [HF Dataset (gated)](https://huggingface.co/datasets/tanhuajie2001/Robo-Dopamine-GRM-Dataset) |
>>>>>>> 42587cdc2dec00d7c0883a4b9437b2f5228ea164
| [RoboArena](datasets/RoboArena.md) | 2025-06 | 分布式双盲真机策略评测；含 preference、feedback 与成败 rollout | Robot / Real | video + proprio/action + YAML | 3,883 sessions；10,783 policy episodes；21.7 GB | 有（task-success） | 有（公开 evaluation rollout） | 无 | 无 | [HF DataDump](https://huggingface.co/datasets/RoboArena/DataDump_07-17-2026) · [Website](https://robo-arena.github.io/) |
| [PhAIL](datasets/PhAIL.md) | 2026-05 | Franka FR3 真机 VLA 评测；公开视频、telemetry、结果与 safety-stop run | Robot / Real | multi-view video + state/action + events | v1.0：594 eval runs；352 demos（~12 GB） | 有（completion / time / UPH） | 有（失败/超时/safety stop；无 corrective action） | 无 | 有（粗粒度 outcome） | [Release](https://phail.ai/releases/v1.0) · [Paper](https://arxiv.org/abs/2605.29710) |
| [ManipArena](datasets/ManipArena.md) | 2026-03 | 20 个 reasoning-oriented 真机任务；公开 expert demonstrations | Robot / Real + Sim | 3×RGB + state/action + motor + language | 10,812 trajectories；13.5M frames；~188 h | 无统一帧级进度 | 无（公开 real 数据为 expert demos） | 有（partial-credit + 三层语言描述） | 无 | [HF (gated)](https://huggingface.co/datasets/ManipArena/maniparena-dataset) · [Paper](https://arxiv.org/abs/2603.28545) |
| [RoboChallenge Table30 v2](datasets/RoboChallenge-Table30v2.md) | 2026-05 | 30 个任务、4 种 embodiment 的在线真机 benchmark 配套数据 | Robot / Real | multi-view video + robot state + metadata | ~1.01 TB | 有（task score / grading points） | 待核验（非统一 eval rollout dump） | 有（评分点） | 无 | [HF](https://huggingface.co/datasets/RoboChallenge/Table30v2) · [Website](https://robochallenge.ai/) |
| [VLA-REPLICA](datasets/VLA-REPLICA.md) | 2026-05 | 低成本 SO-101 可复现实机 VLA benchmark；ID/OOD reference scenes | Robot / Real | top/wrist RGB + state/action + language | 10 tasks；500 demos；90 scene refs；~1.97 GB | 无 | 无公开统一 test rollout dump | 无 | 无 | [HF](https://huggingface.co/datasets/HenryZhang/VLAReplica_SFT_data) · [GitHub](https://github.com/IRVLUTD/VLAReplica) |
| [RoboDojo Real](datasets/RoboDojo-Real.md) | 2026-07 | 18 个真机任务、3 种 embodiment；RealEval 远程评测 | Robot / Real + Sim | task/config assets + result artifacts | 18 real tasks；bulk rollout 待核验 | 有（评测结果级） | 未确认公开 bulk real rollout | 待核验 | 无 | [Website](https://robodojo-benchmark.com/) · [GitHub](https://github.com/RoboDojo-Benchmark/RoboDojo) |
| [FurnitureBench](datasets/FurnitureBench.md) | 2023-05 | 长时程真实家具装配 benchmark；公开成功 demonstrations | Robot / Real | RGB + robot state + action + reward/skill | 5,100 demos；219.6 h；~1.18 TB | 有（reward / skill flags） | 无（成功 demos） | 有（skill flags） | 无 | [Dataset](https://clvrai.github.io/furniture-bench/docs/tutorials/dataset.html) · [GitHub](https://github.com/clvrai/furniture-bench) |
| [TriFinger RL](datasets/TriFinger-RL.md) | 2023-05 | Push/Lift 真实机器人 offline RL 数据；多质量 behavior policy | Robot / Real + Sim | Zarr state/action/reward + optional RGB | >100 h；单个 real image dataset 46–100 GB | 有（reward / return） | 有次优行为（无 recovery 标签） | 无 | 无 | [Data (DOI)](https://doi.org/10.17617/3.DXZ7TL) · [Docs](https://webdav.tuebingen.mpg.de/trifinger-rl/docs/datasets/index.html) |
| [PRIMO-R1](datasets/PRIMO-R1.md) | 2026-03 | Process reasoning critic；116.8k SFT + 328.5k RL；23.7k bench | Robot / Real + Sim | video + init/current frame + CoT progress | Bench 23.7k；媒体 ~78 GB | 有（1–100 + CoT） | 有（失败检测 + real-humanoid OOD） | 无 | 无 | [HF Collection](https://huggingface.co/collections/LeonOverload/primo-r1) · [Bench JSON](https://huggingface.co/datasets/LeonOverload/primo-bench-json) |
| [AgiBot World 2026](datasets/AgiBotWorld2026.md) | 2026-03 | G2 真实场景；Task Frame / skill / bbox / 失败恢复 key frame | Robot / Real | multi-view video + state + action + language | ~2,976 h / 13.2 TB；sample ~7 GB | 有（step/success_frame） | 有（Error/Intervention + recovery） | 有（Task Frame + instruction_segments） | 有（error_cause） | [HF](https://huggingface.co/datasets/agibot-world/AgiBotWorld2026) · [Site](https://agibot-world.com) |
| [REBOOT](datasets/REBOOT.md) | 2026-05 | REBOOT26 双臂 WidowX recovery 轨迹；LeRobot v3.0 | Robot / Real | video + state + action | 38 task datasets（HF org） | 无 | 有（recovery / remove / install） | 无 | 无 | [HF Org](https://huggingface.co/REBOOT26) |
| [Guardian FailCoT / RoboFail](datasets/Guardian-FailCoT-RoboFail.md) | 2025-12 | FailCoT 合成失败 reasoning；RoboFail OOD 评测 | Robot / Sim + Real | multi-view image + CoT | FailCoT 30.9k train；RoboFail 130 scenarios | 无 | 有（planning + execution 失败） | 有 | 有 | [Guardian HF](https://huggingface.co/collections/paulpacaud/robotic-failure-detection-dataset-and-model-guardian) · [RoboFail OOD](https://huggingface.co/datasets/paulpacaud/Guardian-FailCoT-OOD-datasets) |

### 真机评测数据角色（R2）

为避免把“真机 benchmark 的训练集”误写成“候选策略的测试 rollout”，真机评测相关条目采用以下分级：

| 分级 | 定义 | 当前条目 |
| --- | --- | --- |
| **R2-A** | 已公开真实 policy evaluation rollouts / logs，数据本身就是评测结果 | RoboArena、PhAIL |
| **R2-B** | 真机 benchmark，但公开下载内容主要是 demonstrations、task/config assets 或 reference scenes；测试 rollout 需自行运行或远程评测产生 | ManipArena、RoboChallenge Table30 v2、VLA-REPLICA、RoboDojo Real、FurnitureBench |
| **R2-C** | 以真实机器人为主的 offline benchmark（可含补充仿真来源），与现代 VLA 在线评测分开 | VLAC-Cut-FullData、TriFinger RL |

各详情卡使用 `Dataset Role` 与 `R2 Classification` 明确标注。`safety stop` 只表示风险干预信号，不等同于接管后继续操作的 `corrective takeover action`。

VLAC-Cut-FullData 虽归入 R2-C，但并非纯真机数据：论文报告其全量标注约 **96.8% 来自真机**（ARX、DROID），约 **3.2% 来自仿真**（LIBERO、VLABench）。

### 字段说明

| 列名 | 含义 |
| --- | --- |
| Dataset | 数据集名称（详情见 `datasets/` 下卡片） |
| Date | 论文/官方发布年月 |
| Description | 覆盖的机器人类型、任务与标注特点 |
| Domain | Robot/Human + Real/Sim |
| Modality | 观测/状态/动作/语言等 |
| Size | 官方体量或 snapshot 大小 |
| Dataset Role | evaluation rollout、training demonstration、benchmark asset 等数据角色（详情卡字段） |
| R2 Classification | R2-A / R2-B / R2-C 真机评测分级（详情卡字段） |
| Progress Annotation | 是否有进度/价值/dense reward 标注 |
| Failure or Recovery Trajectory | 分别说明成功、失败、实际执行恢复与仅文本纠错计划；`non-expert`、最终失败和 recovery 不能互相替代 |
| Subtask Annotation | 是否有子任务/阶段标注 |
| Failure Taxonomy | 是否有失败类型 taxonomy |
| Download Link | 官方下载入口 |

## 本地镜像（可选）

本仓库只存元信息。如需本机缓存 HF 数据，建议放到相对目录：

```text
../datasets/<DatasetName>/
```

示例（需先 `huggingface-cli login`，在仓库根目录执行）：

```bash
hf download X-Humanoid/Robo-ValueRL --repo-type dataset --local-dir ../datasets/Robo-ValueRL
hf download teetone/RoboReward --repo-type dataset --local-dir ../datasets/RoboReward
hf download RoboArena/DataDump_07-17-2026 --repo-type dataset --local-dir ../datasets/RoboArena
# VLAC-Cut-FullData 全仓约 956 GB；下例仅下载脚本与四个 test split
hf download InternRobotics/VLAC-Cut-FullData --repo-type dataset --include "README.md" "scripts/*" "benchmark_style_all/test_*/*" --local-dir ../datasets/VLAC-Cut-FullData-eval
hf download ManipArena/maniparena-dataset --repo-type dataset --include "real/**" --local-dir ../datasets/ManipArena-real
hf download HenryZhang/VLAReplica_SFT_data --repo-type dataset --local-dir ../datasets/VLA-REPLICA/SFT-data
# Dopamine 为 gated dataset，需先在 HF 申请访问
hf download tanhuajie2001/Robo-Dopamine-GRM-Dataset --repo-type dataset --local-dir ../datasets/Dopamine-GRM
hf download LeonOverload/primo-bench-json --repo-type dataset --local-dir ../datasets/PRIMO-R1/primo-bench-json
hf download agibot-world/AgiBotWorld2026 --repo-type dataset --local-dir ../datasets/AgiBotWorld2026
hf download paulpacaud/Guardian-FailCoT-OOD-datasets --repo-type dataset --local-dir ../datasets/Guardian-OOD
```

## 贡献与维护

- 不确定的信息使用 `待核验` 或 `未知`。
- 新增数据集：在 `datasets/` 添加卡片，并更新上表一行。
- 优先链接 **论文 / 项目页 / Hugging Face / GitHub**，避免只放二级转载。
