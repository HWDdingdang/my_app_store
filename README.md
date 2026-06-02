# 1Panel App Store: Third-Party Application Store Extension

An open-source, community-driven third-party application marketplace extension for the **1Panel** server management container ecosystem. 

This repository allows independent developers and server administrators to securely deploy verified applications on production servers with one click via Docker Compose.

---

## 🚀 Available Applications

The store currently maintains and features the following application extensions:

* **`dd-dispatcharr`**: Standardized containerized tool for advanced media stack queue dispatching.
* **`dd-iptv-api`**: High-performance IPTV stream API processing and list optimization service.
* **`dd-lunatv`**: Dedicated customized web-client deployment engine for LunaTV streaming platform.

---

## ⏰ Automated Sync via 1Panel Cronjob (Recommended)

Instead of running the script manually, you can set up a **Cronjob** inside your 1Panel dashboard to automatically keep the application store up-to-date.

### Deployment Steps:
1. Log into your **1Panel Dashboard** -> Navigate to **Cronjobs**.
2. Click **Create Cronjob** and configure the following parameters:
   * **Type:** Shell Script
   * **Name:** Sync Third-Party App Store
   * **Execution Cycle:** e.g., Every Day (每天) or Every Hour (每小时)
3. Copy the full content of **`sync.sh`** from this repository and paste it directly into the **Script Content** field:
4. Click Save, then click Execute (执行) to run it immediately.
5. Go to App Store -> Local Apps, and click Refresh in the top right corner. All third-party apps will seamlessly appear!
