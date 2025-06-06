Here’s a professional and ready-to-showcase **Git Issue Debug Document** you can use in Markdown (`.md`) format — suitable for GitHub Wiki, internal knowledge bases like Confluence, or DevOps runbooks.

---

## 📄 Git Pull Successful But File Not Visible on EC2 – Root Cause & Resolution

---

### 🧩 Problem Statement

After pushing a new file to the GitHub repository and performing a successful `git pull` on an EC2 instance, the expected file did **not appear** in the local file system on the instance.

---

### 🕵️ Investigation

Several checks were performed to identify the root cause:

1. **Checked Git Remote and Branch**

   ```bash
   git remote -v
   git branch
   ```

   ➤ Verified we were on the correct branch (`main`).

2. **Inspected Local File System**

   ```bash
   ls -la
   find . -name "filename"
   ```

   ➤ File was not present in the working directory.

3. **Checked Git Status**

   ```bash
   git status
   ```

   ➤ Detected that the working directory had **local changes** or was in a **detached/dirty state**, preventing proper pull behavior.

---

### 🛠 Solution

We resolved the issue by **forcing a reset** of the local branch to match the remote:

```bash
git reset --hard
```

This command:

* Reset the local repository to the latest commit.
* Discarded all uncommitted local changes.
* Cleaned up the working directory.

---

### ✅ Result

* Pulled changes were now fully reflected in the EC2 file system.
* The missing file appeared as expected.
* Git repository on EC2 was now fully synced with the remote branch.

---

### 💡 Root Cause

The Git pull did **not override local changes** or conflicts due to uncommitted modifications or a corrupted working tree.

Even though the pull was "successful" from Git’s perspective, the file was **not updated locally**.

---

### 🧠 Recommendations

To avoid such issues in the future:

* Always run:

  ```bash
  git status
  ```

  before any pull operation.

* If local changes exist:

  ```bash
  git stash
  git pull
  git stash pop
  ```

* Use `git reset --hard` only when you are certain that no local changes need to be saved.

* For untracked files/folders that cause issues, also run:

  ```bash
  git clean -fd
  ```

---

### 📘 Learnings

* A successful `git pull` does not always guarantee updated files if local changes exist.
* Clear Git workflows and state awareness are essential when managing code across distributed environments like EC2.

---

Let me know if you want:

* This exported as `.md` or `.pdf`
* A version in Confluence/HTML format
* Your org’s name or team name added for internal documentation branding.
