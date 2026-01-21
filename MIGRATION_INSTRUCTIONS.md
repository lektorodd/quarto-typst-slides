# Branch Migration Instructions

## Current Situation
This branch (`copilot/set-new-main-branch`) contains all the content that should become the new `main` branch.

## What Needs To Be Done

### Step 1: Merge this PR
Once this Pull Request is approved and merged, the content from `copilot/set-new-main-branch` will be in the `main` branch.

### Step 2: Delete the old branch (Optional)
After merging, you can delete the `copilot/set-new-main-branch` branch:
- Go to the Pull Request page
- After merging, click "Delete branch" button

### Alternative: Force Replace Main (Advanced)
If you want to completely replace main's history instead of merging:

```bash
# Clone the repository
git clone https://github.com/lektorodd/quarto-typst-slides.git
cd quarto-typst-slides

# Fetch all branches
git fetch --all

# Checkout the new branch
git checkout copilot/set-new-main-branch

# Force push to main (this will replace main completely)
git push -f origin copilot/set-new-main-branch:main

# Delete the old branch
git push origin --delete copilot/set-new-main-branch
```

⚠️ **Warning**: Force pushing will rewrite the main branch history. Only do this if you're sure you want to completely replace main.

## What This PR Does
This PR merges `copilot/set-new-main-branch` into `main`, effectively making the current branch the new main branch content.
