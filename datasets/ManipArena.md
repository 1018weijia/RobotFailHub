# ManipArena

| 字段 | 内容 |
| --- | --- |
| **Date** | 2026-03 |
| **Paper** | [ManipArena: Comprehensive Real-world Evaluation of Reasoning-Oriented Generalist Robot Manipulation](https://arxiv.org/abs/2603.28545) |
| **Domain** | Robot / Real + Sim（本卡重点为 `real/`） |
| **Dataset Role** | benchmark-aligned expert demonstration |
| **R2 Classification** | R2-B — 真机 benchmark，公开数据主要用于训练/适配 |
| **Modality** | 3×RGB video, state, action, motor position/velocity/current, language |
| **Size** | 20 个真实任务，10,812 条 expert trajectories，13.5M frames，约 188 robot-hours；另含 3 个仿真任务 |
| **Progress Annotation** | 无统一帧级进度；benchmark 支持 partial-credit scoring |
| **Failure or Recovery Trajectory** | 无 — 公开 `real/` 主要是 expert demonstrations |
| **Subtask Annotation** | 有 — benchmark 采用 subtask-level partial-credit；15 个桌面任务另提供三层语言描述 |
| **Failure Taxonomy** | 无 |
| **License** | Apache-2.0；HF 为自动审批 gated access |

## Description

ManipArena 是面向推理型双臂操作的标准化真机评测框架，覆盖 execution reasoning、semantic reasoning 和 mobile manipulation。公开 Hugging Face 数据采用 LeRobot v2.1 结构，真实部分包含 20 个任务、三个同步相机流和 20 Hz 的状态/动作数据。

公开 trajectories 是供参赛模型训练或适配的 expert demonstrations；候选 policy 的物理测试需要按照 benchmark protocol 另行运行，不能把这些 demonstrations 标作 evaluation rollout。

## Dataset Layout

```text
real/
├── execution_reasoning/   # 10 tasks，约 5,000 episodes
├── semantic_reasoning/    # 5 tasks，约 2,800 episodes
└── mobile_manipulation/   # 5 tasks，约 2,900 episodes
```

每个任务包含 Parquet 状态/动作、MP4 视频与 LeRobot metadata。桌面任务使用 56-D state/action，移动操作任务使用 62-D state/action。

## Official Sources

- Dataset: https://huggingface.co/datasets/ManipArena/maniparena-dataset
- Paper: https://arxiv.org/abs/2603.28545

## Download

```bash
hf download ManipArena/maniparena-dataset \
  --repo-type dataset \
  --include "real/**" \
  --local-dir ../datasets/ManipArena-real
```

## Notes

- 下载前需登录 Hugging Face 并接受自动审批的访问条件。
- HF 仓库同时包含 sim 数据；研究真机时应使用 `--include "real/**"`，避免无差别镜像。
- 三层语言 annotation 覆盖 15 个桌面任务，暂不覆盖 mobile manipulation。
