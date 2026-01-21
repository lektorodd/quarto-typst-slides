# Branch Migration Instructions

## Goal
Make the `copilot/set-new-main-branch` branch the new `main` branch and delete the old `main`.

## Current Situation
- **Current branch**: `copilot/set-new-main-branch` 
- **Main branch**: `main`
- **Status**: This branch is ahead of main by 1 commit (plus this new commit with instructions)

## Recommended Approach: Merge this PR

### Step 1: Merge this Pull Request
When you merge this PR, the content from `copilot/set-new-main-branch` will be merged into `main`. This is the safest approach.

1. Review and approve this PR
2. Click "Merge Pull Request" 
3. Choose merge strategy (recommend "Create a merge commit" or "Squash and merge")
4. Confirm merge

### Step 2: Delete the branch
After merging, delete the `copilot/set-new-main-branch` branch:
- On the PR page, click "Delete branch" button after merging

## Result
After completing these steps:
- ✅ Main branch will have all content from `copilot/set-new-main-branch`
- ✅ The old feature branch will be deleted
- ✅ Main branch becomes the new main (mission accomplished!)

---

## Alternative: Force Replace (Advanced Users Only)

If you want to completely replace main's history with this branch (not just merge):

```bash
# Backup first!
git clone https://github.com/lektorodd/quarto-typst-slides.git backup
cd quarto-typst-slides

# Fetch and checkout
git fetch --all
git checkout copilot/set-new-main-branch

# Force push to replace main
git push -f origin copilot/set-new-main-branch:main

# Delete the old branch
git push origin --delete copilot/set-new-main-branch
```

⚠️ **Warning**: Force pushing rewrites history and can cause issues for collaborators. Only use if you understand the implications.

---

## Summary
**Simple way**: Just merge this PR and delete the branch afterward. That's it!
