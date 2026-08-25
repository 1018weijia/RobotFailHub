# Guardian FailCoT / RoboFail

| 字段 | 内容 |
| --- | --- |
| **Date** | 2025-12（Guardian）/ 2023-11（RoboFail） |
| **Paper** | [Guardian / FailCoT (2512.01946)](https://arxiv.org/abs/2512.01946) · [REFLECT / RoboFail (2306.15724)](https://arxiv.org/abs/2306.15724) |
| **Domain** | Robot / Sim + Real |
| **Modality** | multi-view image, language, CoT failure reasoning |
| **Size** | FailCoT **30,876 train**（RLBench 18,166 + BDV2 12,710 exec/plan 样本）；RoboFail **130 scenarios**（100 sim + 30 real） |
| **Progress Annotation** | 无（failure verification 为主） |
| **Failure or Recovery Trajectory** | 有 — planning + execution 成败与 reasoning trace |
| **Subtask Annotation** | 有 — subtask 级 execution/planning 验证 |
| **Failure Taxonomy** | 有 — planning vs execution；Guardian 含 fine-grained category |

## Description

**FailCoT** 通过扰动成功轨迹合成 planning/execution 失败，并用 VLM 生成 step-by-step reasoning traces，训练 **Guardian** 多视角 failure detector。

**RoboFail**（REFLECT, CoRL 2023）是经典 real-robot failure benchmark：AI2THOR 100 仿真失败 + UR5e 30 真实遥操作失败，含 failure taxonomy。Guardian 将其 re-export 为统一 schema，与 UR5-Fail、RoboVQA 一并作 OOD 评测。

## Download

### Guardian / FailCoT（训练 + 合成数据）

- HF Collection: https://huggingface.co/collections/paulpacaud/robotic-failure-detection-dataset-and-model-guardian
- 模型: https://huggingface.co/paulpacaud/guardian-thinking
- GitHub: https://github.com/paulpacaud/Guardian-FailCot
- 项目页: https://www.di.ens.fr/willow/research/guardian/

### OOD 评测 bundle（含 RoboFail）

- https://huggingface.co/datasets/paulpacaud/Guardian-FailCoT-OOD-datasets
  - `robofail` — 153 execution + 30 planning samples（单视角）
  - `ur5fail_test` — 140 + 140（三视角，Guardian 新 benchmark）
  - `robovqa` — 357 execution VQA

### RoboFail 原始数据（REFLECT）

- 项目页: https://robot-reflect.github.io/
- 数据: https://www.cs.columbia.edu/~liuzeyi/reflect_data
- GitHub: https://github.com/real-stanford/reflect

## Notes

- PRIMO-R1 在 RoboFail 上报告 SOTA 67.0% accuracy（failure detection）。
- FailCoT 仿真源：RLBench → `rlbenchfail`；真实源：BridgeData V2 → `bdv2fail`、UR5 自主 rollout → `ur5fail`
