# AgiBot World 2026

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-03 |
| **Paper / Release** | [AGIBOT WORLD 2026 开源发布](https://www.agibot.com/article/231/detail/54.html) |
| **Domain** | Robot / Real（含配套 GenieSim 仿真数据） |
| **Modality** | multi-view video + depth + state + action + language |
| **Size** | 全量约 **2,976 h / 13.2 TB**（HF）；官方 sample `task_3777` ~7 GB；HF `size_categories` 标注 1K–10K episodes |
| **Progress Annotation** | 有 — `instruction_segments` 含 `success_frame_index`；step/skill 级进度，非数值 dense reward |
| **Failure or Recovery Trajectory** | 有 — 保留 error-recovery 轨迹；`Error Frame` / `Intervention Frame` / `Success Frame` |
| **Subtask Annotation** | 有 — `Task Frame` 子任务段 + `instruction_segments` 原子技能（Pick/Place 等） |
| **Failure Taxonomy** | 有 — `frame_detail.error_cause`、`restorable` 等字段 |

## Description

智元机器人发布的 **AGIBOT WORLD 2026** 真实世界具身智能数据集，基于 **AgiBot G2** 双臂平台采集，覆盖商业、家庭等场景。数据以 **LeRobot v2.1** 组织，在标准 schema 之上扩展了三层标注：

1. **Task Frame** — 长时程 episode 内的子任务段（自然语言 + 帧区间）
2. **2D Bounding Box** — 交互物体框 + 类别 + 相机
3. **Instruction Segments** — 更细粒度 step/skill 标注（含 `success_frame_index`）

此外 `key_frame` 支持失败/干预/成功关键帧，字段含 `error_cause`、`restorable`，适合 failure mining、recovery imitation 与 hierarchical policy 研究。官方提供 `split_episode.py` 将长时程轨迹拆为单指令 LeRobot episode。

## Annotation Highlights

| 类型 | 字段 / 名称 | 用途 |
| --- | --- | --- |
| 子任务 | `Task Frame` | 长 horizon 切分、单指令训练 |
| 技能步 | `instruction_segments[].skill` | 原子操作（Pick/Place 等） |
| 物体 | `2D Bounding Box` | object-conditioned / grounding |
| 失败 | `Error Frame` + `error_cause` | failure detection / taxonomy |
| 干预/恢复 | `Intervention Frame`, `take_over`, `restorable` | HIL / recovery |
| 成功 | `Success Frame`, `is_result_succeed` | success verification |

## Download

- Hugging Face: https://huggingface.co/datasets/agibot-world/AgiBotWorld2026
- 官网: https://agibot-world.com
- Challenge 子集: https://huggingface.co/datasets/agibot-world/AgiBotWorldChallenge-2026
- 样例: `task3777/380098_380609.tar.gz`（~7 GB）

```bash
# 仅拉 sample task（推荐先验结构）
GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/datasets/agibot-world/AgiBotWorld2026
cd AgiBotWorld2026
git sparse-checkout init
git sparse-checkout set task3777
git pull origin main
```

## Notes

- License: **CC BY-NC-SA 4.0**（商用需另行授权）
- 数据集分阶段发布（ImitationLearning / ReinforcementLearning 等 research track）
- 与 PRIMO-R1 的 `agibot-id/ood` bench 子集相关，但本仓库条目指向官方完整 AgiBotWorld2026 数据发布
- 本地镜像建议：`../datasets/AgiBotWorld2026/`
