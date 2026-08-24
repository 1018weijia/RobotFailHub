# PhAIL

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-05 |
| **Paper** | [PhAIL: A Real-Robot VLA Benchmark and Distributional Methodology](https://arxiv.org/abs/2605.29710) |
| **Domain** | Robot / Real |
| **Dataset Role** | evaluation rollout + benchmark-aligned demonstration |
| **R2 Classification** | R2-A — 已公开真实 policy evaluation artifacts |
| **Modality** | synchronized multi-view video, robot state/action telemetry, task/config metadata, outcome and timing |
| **Size** | v1.0：594 条模型评测 run；352 条 VR 遥操作微调 demonstrations（约 12 GB） |
| **Progress Annotation** | 有 — completion、successful items、elapsed time、UPH 等运行级指标 |
| **Failure or Recovery Trajectory** | 有 — 完整发布失败、超时与 safety-stop 评测 run；无 corrective takeover action |
| **Subtask Annotation** | 无 — 仅逐物体完成数与运行级事件 |
| **Failure Taxonomy** | 有（粗粒度）— Success / Fail / Safety，含 timeout 与不可恢复控制器错误定义 |
| **License** | 待核验 — 官方说明微调数据采用非商业许可；不可由 Apache-2.0 代码许可推断数据许可 |

## Description

PhAIL 是在 Franka Research 3、Robotiq 2F-85 与双 ZED 相机上运行的真实机器人 VLA 评测。v1.0 对 OpenPI、GR00T、SmolVLA 和 ACT 进行盲测与随机化评测，任务为四类物体的 bin-to-bin order picking。

评测数据本身就是可审计的真实 rollout artifact：官方发布同步多相机视频、机器人状态与动作日志、场景配置、计时、完成量和结果标签。人工在运行中唯一可用的干预是触发 safety stop 并终止 run，因此不能把它标作含接管后 corrective action 的 takeover 数据集。

## Official Sources

- Release v1.0: https://phail.ai/releases/v1.0
- Leaderboard / run explorer: https://phail.ai/
- Frozen v1.0 white paper: https://phail.ai/whitepaper.pdf
- Data: `s3://positronic-public/phail/v1.0/dataset/`
- Evaluation framework: https://github.com/Positronic-Robotics/positronic

## Download / Browse

```bash
uv run --with positronic positronic-server @positronic.cfg.phail.v1_0.ds.rollouts
```

也可安装后浏览：

```bash
pip install positronic
positronic-server @positronic.cfg.phail.v1_0.ds.rollouts
```

## Notes

- v1.0 固定发布包含 594 条模型评测 run；网站当前总 episode 数会随着 human、teleoperation 与新评测结果增加，不能与固定 release 数量混用。
- 352 条微调 demonstrations 属于 benchmark-aligned training data，不是模型 evaluation rollout。
- safety stop 是风险干预信号，不包含干预后的人工纠正动作序列。
