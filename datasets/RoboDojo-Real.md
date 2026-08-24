# RoboDojo Real-World Benchmark

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-07 |
| **Paper** | [RoboDojo: A Unified Sim-and-Real Benchmark for Comprehensive Evaluation of Generalist Robot Manipulation Policies](https://arxiv.org/abs/2607.04434) |
| **Domain** | Robot / Real + Sim（本卡仅讨论 real benchmark） |
| **Dataset Role** | evaluation framework, task/config assets, result artifacts |
| **R2 Classification** | R2-B — 真机 benchmark 与远程评测系统，未确认公开 bulk real rollout dump |
| **Modality** | task/scene/robot/camera configs, policy result artifacts; real rollout 由 RealEval 产生 |
| **Size** | 18 个真实任务，3 种 embodiment；另有 42 个仿真任务 |
| **Progress Annotation** | 有（评测结果级）— task-specific score / leaderboard result |
| **Failure or Recovery Trajectory** | 未确认存在可批量下载的完整 real rollout 数据集 |
| **Subtask Annotation** | 任务配置与评分规则可用；逐轨迹 subtask 标注待核验 |
| **Failure Taxonomy** | 无统一公开 taxonomy |
| **License** | 代码 MIT；数据与远程真机 result artifacts 的统一许可待核验 |

## Description

RoboDojo 统一 42 个 Isaac Sim 任务与 18 个真实机器人任务，并通过 RoboDojo-RealEval 提供标准硬件、场景重置、评测协议和远程云评测。真实部分覆盖 Piper X、Piper 和 ARX X5 三类 embodiment。

官方仓库明确说明当前 release 为 `eval-only`：开放 simulator client、benchmark tasks、asset/config validation 和 result artifacts，policy integration/server 由 XPolicyLab 管理。这不等于已经发布类似 RoboArena 的完整 bulk real rollout dump。

## Official Sources

- Project: https://robodojo-benchmark.com/
- Code: https://github.com/RoboDojo-Benchmark/RoboDojo
- Real task catalog: https://robodojo-benchmark.com/doc/real-tasks/
- Installation and assets: https://robodojo-benchmark.com/doc/usage/install-and-download/
- Paper: https://arxiv.org/abs/2607.04434

## Notes

- 适合持续监控 real task definitions、camera/robot configs、leaderboard 与 result artifact 更新。
- 在官方明确给出 real rollout partition、体量和许可前，不应全量镜像混合 sim+real 数据源。
- `eval-only` 描述的是软件 release 的职责边界，不代表“只包含公开真实评测轨迹”。
