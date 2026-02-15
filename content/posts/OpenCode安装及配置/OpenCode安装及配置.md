---
title: OpenCode安装及配置
author: Francis Fu
date: 2026-02-14
lastmod: 2026-02-14
math: true
draft: false
---

最近的几年来，我的 AI 辅助编程工具先后从 Copilot -> Cursor -> KiloCode ，再转到近期使用了 OpenCode。体验到了 OpenCode 加上 Oh-My-OpenCode 的强大之处，可以说用上就再也回不去了。在此对 Windows 系统上的环境配置作一记录。 

<!--more-->

## 0. 系统环境

* Windows 11 25H2
* Visual Studio Code 1.109.3
* Node.js 26.01.14

## 1. 安装Chocolatey

以管理员权限打开 **Windows PowerShell**，执行以下命令：

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
之后会自动安装 Chocolatey。

安装完成后，关闭并重新打开终端，然后执行：

```powershell
choco --version
```

看到版本号就说明安装成功了。

## 2. 安装 WezTerm

OpenCode 作为一个终端编辑器，支持如下现代化终端：

* WezTerm，跨平台
* Alacritty，跨平台
* Ghostty，Linux 和 macOS
* Kitty，Linux 和 macOS

对于 Windows 平台的两款，我个人比较倾向于WezTerm。

在终端运行命令 `choco install wezterm -y` 进行安装。

安装后，继续在终端依次运行如下命令以打开 WezTerm 配置文件：

```powershell
New-Item -Path "$env:USERPROFILE\.wezterm.lua" -ItemType File -Force
code "$env:USERPROFILE\.wezterm.lua"
```

之后可以根据 WezTerm 官方文档进行配置修改。以下是一个可用的参考。

```lua
local wezterm = require 'wezterm'
local config = {}

-- 使用更新的配置方式
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ============ 基础设置 ============
-- 默认 Shell
config.default_prog = { 'powershell.exe' }
-- config.default_prog = { 'pwsh.exe' }  -- PowerShell 7
-- config.default_prog = { 'wsl.exe', '~' }  -- WSL

-- 启动时窗口大小
config.initial_cols = 120
config.initial_rows = 30

-- ============ 字体设置 ============
config.font = wezterm.font('JetBrains Maple Mono', { weight = 'Medium' })
-- 备选字体：'Cascadia Code', 'Fira Code', 'Consolas'
config.font_size = 14
config.line_height = 1.1

-- 启用连字
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- ============ 外观设置 ============
config.color_scheme = 'Catppuccin Mocha'
-- 其他主题：'Catppuccin Mocha', 'Tokyo Night', 'Dracula'

-- 背景透明度（1.0 = 不透明）
config.window_background_opacity = 0.95

-- 窗口边距
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- 标签栏设置
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- 无标题栏（可选，更简洁）
-- config.window_decorations = "RESIZE"

-- ============ 快捷键 ============
config.keys = {
  -- Ctrl+Shift+T 新建标签
  { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'DefaultDomain' },
  
  -- Ctrl+Shift+W 关闭标签
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = true } },
  
  -- Alt+数字 切换标签
  { key = '1', mods = 'ALT', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'ALT', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'ALT', action = wezterm.action.ActivateTab(2) },
  
  -- Ctrl+Shift+| 垂直分屏
  { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  
  -- Ctrl+Shift+_ 水平分屏
  { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  
  -- Ctrl+Shift+F 搜索
  { key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action.Search { CaseSensitiveString = '' } },
  
  -- Ctrl+Shift+C/V 复制粘贴
  { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },
}

-- ============ 其他设置 ============
-- 关闭提示音
config.audible_bell = 'Disabled'

-- 光标样式
config.default_cursor_style = 'BlinkingBar'
-- 可选：'SteadyBlock', 'BlinkingBlock', 'SteadyUnderline', 'BlinkingBar'

-- 滚动回溯行数
config.scrollback_lines = 10000

-- 关闭更新检查（可选）
config.check_for_updates = false

return config
```

## 3. 安装 OpenCode

在 WezTerm 终端运行命令 `choco install opencode` 进行安装，安装后在终端输入 `opencode` 以启动。打开时默认是免费的“Big Pickle”模型，在对话框输入以下命令以安装 Oh-My-OpenCode 插件：

```
按照以下说明安装和配置 oh-my-opencode：
https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/refs/heads/master/docs/guide/installation.md
```

之后智能体会自动读取安装说明并进行插件安装。安装过程中会提示是否要启用一些订阅例如 Claude Code、ChatGPT、Gemini、Copilot、ZAI等，如有的话可以接入，没有则全部选择 No。安装好后关闭终端即可。

接下来打开 C:\Users\你的用户名\\.config\opencode路径，里面应该有两个文件：opencode.json和oh-my-opencode.json。根据需求可以进行编辑设置。我个人使用 [AiHubMix](https://aihubmix.com/) 作为 Provider，以下设置仅供参考。

opencode.json
```json
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": [
    "oh-my-opencode@latest"
  ],
  
  "model": "aihubmix-claude/claude-opus-4-6",
  
  "provider": {
    "aihubmix-claude": {
      "id": "aihubmix-claude",
      "npm": "@ai-sdk/anthropic",
      "api": "https://aihubmix.com/v1",
      "name": "AIHUBMIX Claude",
      "options": {
        "apiKey": "sk-你的密钥",
        "headers": {
          "APP-Code": "WHVL9885"
        }
      },
      "models": {
        "claude-opus-4-6": {
          "id": "claude-opus-4-6",
          "name": "Claude Opus 4.6",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "temperature": true,
          "knowledge": "2025-05",
          "release_date": "2026-02-05",
          "modalities": { "input": ["text", "image", "pdf"], "output": ["text"] },
          "cost": { "input": 5, "output": 25, "cache_read": 0.5, "cache_write": 6.25 },
          "limit": { "context": 200000, "output": 32000 }
        },
        "claude-sonnet-4-5": {
          "id": "claude-sonnet-4-5",
          "name": "Claude Sonnet 4.5",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "temperature": true,
          "knowledge": "2025-01-31",
          "release_date": "2025-09-29",
          "modalities": { "input": ["text", "image", "pdf"], "output": ["text"] },
          "cost": { "input": 3.3, "output": 16.5, "cache_read": 0.33, "cache_write": 4.125 },
          "limit": { "context": 200000, "output": 128000 }
        },
        "claude-haiku-4-5": {
          "id": "claude-haiku-4-5",
          "name": "Claude Haiku 4.5",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "temperature": true,
          "knowledge": "2025-02-28",
          "release_date": "2025-09-29",
          "modalities": { "input": ["text", "image", "pdf"], "output": ["text"] },
          "cost": { "input": 1.1, "output": 5.5, "cache_read": 0.11, "cache_write": 1.25 },
          "limit": { "context": 200000, "output": 128000 }
        }
      }
    },
    
    "aihubmix-openai": {
      "id": "aihubmix-openai",
      "npm": "@ai-sdk/openai",
      "api": "https://aihubmix.com/v1",
      "name": "AIHUBMIX OpenAI",
      "options": {
        "apiKey": "sk-你的密钥",
        "headers": {
          "APP-Code": "WHVL9885"
        }
      },
      "models": {
        "gpt-5.2-codex": {
          "id": "gpt-5.2-codex",
          "name": "GPT-5.2 Codex",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "structured_output": true,
          "temperature": false,
          "knowledge": "2025-08-31",
          "release_date": "2026-01-14",
          "modalities": { "input": ["text", "image", "pdf"], "output": ["text"] },
          "cost": { "input": 1.75, "output": 14, "cache_read": 0.17 },
          "limit": { "context": 400000, "output": 128000 }
        },
        "gpt-5.2": {
          "id": "gpt-5.2",
          "name": "GPT-5.2",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "temperature": false,
          "knowledge": "2025-08-31",
          "release_date": "2025-12-11",
          "modalities": { "input": ["text", "image"], "output": ["text"] },
          "cost": { "input": 1.75, "output": 14, "cache_read": 0.175 },
          "limit": { "context": 400000, "output": 128000 }
        }
      }
    },
    
    "aihubmix-gemini": {
      "id": "aihubmix-gemini",
      "npm": "@ai-sdk/google",
      "api": "https://aihubmix.com/gemini/v1beta",
      "name": "AIHUBMIX Gemini",
      "options": {
        "apiKey": "sk-你的密钥",
        "headers": {
          "APP-Code": "WHVL9885"
        }
      },
      "models": {
        "gemini-3-pro-preview": {
          "id": "gemini-3-pro-preview",
          "name": "Gemini 3 Pro Preview",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "temperature": true,
          "knowledge": "2025-01-31",
          "release_date": "2025-11-19",
          "modalities": { "input": ["text", "image", "audio", "video"], "output": ["text"] },
          "cost": { "input": 2, "output": 12, "cache_read": 0.2 },
          "limit": { "context": 1000000, "output": 65000 }
        }
      }
    },
    
    "aihubmix-compat": {
      "id": "aihubmix-compat",
      "npm": "@ai-sdk/openai-compatible",
      "api": "https://aihubmix.com/v1",
      "name": "AIHUBMIX Compatible",
      "options": {
        "apiKey": "sk-你的密钥",
        "headers": {
          "APP-Code": "WHVL9885"
        }
      },
      "models": {
        "kimi-k2.5": {
          "id": "kimi-k2.5",
          "name": "Kimi K2.5",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "interleaved": { "field": "reasoning_content" },
          "temperature": true,
          "knowledge": "2025-01-31",
          "release_date": "2026-01-27",
          "modalities": { "input": ["text", "image", "video"], "output": ["text"] },
          "cost": { "input": 0.6, "output": 3, "cache_read": 0.1 },
          "limit": { "context": 256000, "output": 256000 }
        },
        "minimax-m2.5": {
          "id": "coding-minimax-m2.5",
          "name": "MiniMax M2.5",
          "attachment": false,
          "reasoning": true,
          "tool_call": true,
          "interleaved": { "field": "reasoning_content" },
          "temperature": true,
          "knowledge": "2024-06-30",
          "release_date": "2026-02-13",
          "modalities": { "input": ["text"], "output": ["text"] },
          "cost": { "input": 0.2, "output": 0.2 },
          "limit": { "context": 200000, "output": 128000 }
        },
        "glm-5": {
          "id": "coding-glm-5",
          "name": "GLM 5",
          "attachment": false,
          "reasoning": true,
          "tool_call": true,
          "interleaved": { "field": "reasoning_content" },
          "temperature": true,
          "knowledge": "2024-12-31",
          "release_date": "2026-02-12",
          "modalities": { "input": ["text"], "output": ["text"] },
          "cost": { "input": 0.06, "output": 0.22, "cache_read": 0.01 },
          "limit": { "context": 200000, "output": 128000 }
        }
      }
    }
  }
}
```

oh-my-opencode.json
```json
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
  
  "agents": {
    "sisyphus": {
      "model": "aihubmix-claude/claude-opus-4-6",
      "thinking": {
        "type": "enabled",
        "budgetTokens": 100000
      }
    },
    "hephaestus": {
      "model": "aihubmix-openai/gpt-5.2-codex",
      "reasoningEffort": "medium"
    },
    "oracle": {
      "model": "aihubmix-openai/gpt-5.2",
      "reasoningEffort": "medium"
    },
    "librarian": {
      "model": "aihubmix-claude/claude-sonnet-4-5"
    },
    "explore": {
      "model": "aihubmix-claude/claude-haiku-4-5"
    },
    "multimodal-looker": {
      "model": "aihubmix-gemini/gemini-3-pro-preview"
    },
    "prometheus": {
      "model": "aihubmix-compat/glm-5"
    },
    "metis": {
      "model": "aihubmix-compat/kimi-k2.5"
    },
    "momus": {
      "model": "aihubmix-compat/kimi-k2.5"
    },
    "atlas": {
      "model": "aihubmix-compat/minimax-m2.5"
    }
  },
  
  "categories": {
    "visual-engineering": {
      "model": "aihubmix-gemini/gemini-3-pro-preview"
    },
    "ultrabrain": {
      "model": "aihubmix-openai/gpt-5.2-codex",
      "reasoningEffort": "high"
    },
    "deep": {
      "model": "aihubmix-openai/gpt-5.2-codex",
      "reasoningEffort": "high"
    },
    "artistry": {
      "model": "aihubmix-gemini/gemini-3-pro-preview"
    },
    "quick": {
      "model": "aihubmix-compat/kimi-k2.5"
    },
    "unspecified-low": {
      "model": "aihubmix-compat/kimi-k2.5"
    },
    "unspecified-high": {
      "model": "aihubmix-compat/glm-5"
    },
    "writing": {
      "model": "aihubmix-compat/kimi-k2.5"
    }
  },
  
  "sisyphus_agent": {
    "disabled": false,
    "default_builder_enabled": false,
    "planner_enabled": true,
    "replace_plan": true
  },
  
  "git_master": {
    "commit_footer": false,
    "include_co_authored_by": false
  }
}
```
之后打开 WezTerm 终端并输入 opencode，就可以愉快的使用了！