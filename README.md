# Open Source Contributions

A log of my open source work — bug fixes, PRs, and contributions across AI/ML and backend repos.

## Pull Requests

| Repo | PR | Status | What I fixed |
|---|---|---|---|
| `wandb/weave` | [#6922](https://github.com/wandb/weave/pull/6922) | Open | Added `Retry-After` header support in Node SDK — 429s were retrying immediately; added `parseRetryAfterMs()` for seconds and date formats |
| `wandb/weave` | [#6938](https://github.com/wandb/weave/pull/6938) | Open | Fixed stale version hint in `validation.py` — error message told users to upgrade to `>0.51.0` which was already outdated |
| `wandb/weave` | [#6955](https://github.com/wandb/weave/pull/6955) | Open | Fixed recursive `$ref` in `weave.openapi.json` — schema was pointing to itself, causing Mintlify docs to loop |
| `openai/evals` | [#1671](https://github.com/openai/evals/pull/1671) | Open | Sanitized user-supplied shell commands before logging to prevent command injection exposure |
| `openai/evals` | [#1669](https://github.com/openai/evals/pull/1669) | Open | Fixed security issue — raw exceptions with internal file paths were being returned in API responses; replaced with generic messages |
| `openai/evals` | [#1664](https://github.com/openai/evals/pull/1664) | Open | Fixed token usage crash — `add_token_usage_to_result` failing because OpenAI API now returns `CompletionTokensDetails` object instead of int |
| `ragas` | [#2737](https://github.com/vibrantlabsai/ragas/pull/2737) | Open | Fixed `FactualCorrectness` recall bug — recall and F1 modes were using wrong TP variable, returning inflated scores; added 9 unit tests |
| `ragas` | [#2740](https://github.com/vibrantlabsai/ragas/pull/2740) | Open | Handled deprecated Anthropic `top_p` parameter to prevent API errors on newer model versions |

## Logs

Detailed notes per day in [`logs/`](./logs/).
