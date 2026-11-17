# Git Workshop Repository

Practice repository for the ThunderSF Git & Version Control training.

> **This repository is public.** Your GitHub username and anything you commit here can be seen by anyone on the internet. Never add client names, org details, credentials, or anything private. Keep your profile light: a role and a fun fact.

## What is in here

| Path | Purpose |
|---|---|
| `attendees/_template.md` | Copy this to create your own profile in the first lab |
| `attendees/` | Everyone's profile files (one file per person, so nobody collides) |
| `team-tips.md` | Shared file for the merge conflict lab |
| `.github/pull_request_template.md` | Pre-fills the description of your pull request |
| `.github/workflows/` | Automated checks and the merge bot (see below) |
| `scripts/` | Helper scripts used by the checks and by facilitators |

## How contributions work here

You do not push to this repository directly. You work in your own **fork** (a personal copy under your GitHub account) and send changes here with a **pull request**.

1. A bot checks that your pull request changes only the file it should and that the file is filled in correctly.
2. A classmate you choose reviews your pull request and leaves a comment.
3. Once the check passes and someone other than you has commented, the bot merges it.

In real client repositories, the merge step requires a human approval. The bot is here only so a large group can finish in one session.

## Labs

Follow the step-by-step guides in Thunder Academy:

- Module 0: Pre-work (set up Git, GitHub and your fork)
- Module 3: Lab: your first contribution
- Module 4: Lab: staying in sync and merge conflicts
- Module 5: Lab: undo, rollback and history
- Module 6: Lab: Git with an AI agent
- Module 7 (optional): A preview of the Salesforce workflow

## Rules of the road

- One file per pull request.
- File names are lowercase with hyphens: `attendees/jane-doe.md`.
- Never edit `main` in your fork directly. Always work on a branch.
