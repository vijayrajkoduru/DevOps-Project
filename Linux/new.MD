Here’s a detailed description of each command used in your `ec2_user_group_guide.md` file, along with how they **modify or affect the system**:

---

## 🔍 Commands & Their Effects

### ✅ `useradd vijaykumar`

* **Creates a new user** named `vijaykumar`.
* Also **creates a default group** with the same name.
* Adds entries to `/etc/passwd`, `/etc/shadow`, and `/etc/group`.

---

### ✅ `useradd -N vijaykumar`

* Same as above, **but skips creating the default group**.
* User is not assigned to a group with the same name automatically.
* Allows for **custom group assignments**.

---

### ✅ `groupadd DevOps`

* **Creates a new group** named `DevOps`.
* Adds an entry in `/etc/group`.

---

### ✅ `id vijaykumar`

* Displays:

  * **UID** (User ID)
  * **GID** (Primary Group ID)
  * **Group memberships** for the user
* Useful for verifying user-group relationships.

---

### ✅ `cat /etc/passwd`

* Shows a list of **all system users**.
* Each line contains user details like username, UID, home directory, and shell.

---

### ✅ `cat /etc/group`

* Displays a list of **all groups** on the system.
* Shows group names, GIDs, and user memberships.

---

### ✅ `passwd vijaykumar`

* Prompts for setting or changing the **password** of the specified user.
* Updates the `/etc/shadow` file securely.

---

### ✅ `usermod -g DevOps vijaykumar`

* **Changes the primary group** of `vijaykumar` to `DevOps`.
* Only one primary group is allowed per user.
* Reflects in `/etc/passwd`.

---

### ✅ `usermod -aG DevOps2 vijaykumar`

* **Appends** the user to the **secondary group** `DevOps2`.
* Uses `-a` (append) with `-G` (group list).
* Without `-a`, it would **remove user from other secondary groups**.

---

### ✅ `getent group`

* Retrieves and displays **all group entries** using the `Name Service Switch (NSS)`.
* Includes both local and network-based groups (e.g., LDAP, if configured).

---

### ✅ `getent group DevOps2`

* Filters output to show **only the entry** for the specified group (`DevOps2`).
* Good for verifying membership and group existence.

---

### ✅ `userdel vijaykumar`

* **Deletes the user** from the system.
* Does **not remove** the user's home directory or files by default.

---

### ✅ `groupdel DevOps`

* **Deletes the specified group** from the system.
* The group must **not be assigned as a primary group** to any user.

---

If you'd like, I can turn this into a second section in your markdown file or save it as a separate companion document. Let me know!
