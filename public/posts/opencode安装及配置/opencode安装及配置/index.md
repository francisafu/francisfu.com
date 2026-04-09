# OpenCode安装及配置


最近的几年来，我的 AI 辅助编程工具先后从 Copilot -> Cursor -> KiloCode ，再转到近期使用了 OpenCode。体验到了 OpenCode 加上 Oh-My-OpenCode 的强大之处，可以说用上就再也回不去了。在此对 Windows 系统上的环境配置作一记录。 

<!--more-->


## 1. 安装 WezTerm

OpenCode 作为一个终端编辑器，支持如下现代化终端：

* WezTerm，跨平台
* Alacritty，跨平台
* Ghostty，Linux 和 macOS
* Kitty，Linux 和 macOS

对于 Windows 平台的两款，我个人比较倾向于WezTerm。

打开[官网](https://wezterm.org/index.html)进行下载安装即可。

安装后，继续在终端依次运行如下命令以打开 WezTerm 配置文件：

```powershell
New-Item -Path "$env:USERPROFILE\.wezterm.lua" -ItemType File -Force
code "$env:USERPROFILE\.wezterm.lua"
```

之后可以根据 WezTerm 官方文档进行配置修改。以下是一个可用的参考。

```lua
local wezterm = require 'wezterm'
local mux = wezterm.mux 
local config = {}

-- 使用更新的配置方式
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ============ 基础设置 ============
-- 默认 Shell（选择你用的）
config.default_prog = { 'powershell.exe' }
-- config.default_prog = { 'pwsh.exe' }  -- PowerShell 7
-- config.default_prog = { 'wsl.exe', '~' }  -- WSL

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  -- 使窗口最大化 (保留 Windows 任务栏)
  window:gui_window():maximize()
  
  -- 如果你想要真正沉浸式的全屏(连任务栏都没有，类似 F11)，使用下面这行代替上一行：
  -- window:gui_window():toggle_fullscreen()
end)

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
-- 关闭烦人的提示音
config.audible_bell = 'Disabled'

-- 光标样式
config.default_cursor_style = 'BlinkingBar'
-- 可选：'SteadyBlock', 'BlinkingBlock', 'SteadyUnderline', 'BlinkingBar'

-- 滚动回溯行数
config.scrollback_lines = 10000

return config
```

## 3. 安装 OpenCode

在 WezTerm 终端依次运行以下命令进行安装：

```powershell
wsl --install -d Ubuntu
sudo apt update
sudo apt upgrade -y
sudo apt install unzip -y
curl -fsSL https://bun.sh/install | bash
npm install -g playwright
npx playwright install-deps chromium
curl -fsSL https://opencode.ai/install | bash
```

安装后在终端输入 `opencode` 以启动。打开时默认是免费的“Big Pickle”模型，在对话框输入以下指令以安装 Oh-My-OpenCode 插件：

```
按照以下说明安装和配置 oh-my-openagent：
https://raw.githubusercontent.com/code-yeongyu/oh-my-openagent/refs/heads/dev/docs/guide/installation.md
```

之后智能体会自动读取安装说明并进行插件安装。安装过程中会提示是否要启用一些订阅例如 Claude Code、ChatGPT、Gemini、Copilot、ZAI等，如有的话可以接入，没有则全部选择 No。安装好后关闭终端即可。

接下来打开WSL中 ~\\你的用户名\\.config\\opencode 路径，里面应该有两个文件：opencode.json和oh-my-opencode.json。根据需求可以进行编辑设置。我个人使用 [HONE](https://hone.vvvv.ee/) 作为 Provider，以下设置仅供参考。

opencode.json
```json
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": [
    "oh-my-opencode@3.14.0"
  ],
  "model": "hone-claude/claude-opus-4-6",
  "provider": {
    "hone-claude": {
      "id": "hone-claude",
      "npm": "@ai-sdk/anthropic",
      "api": "https://hone.vvvv.ee/v1",
      "name": "HONE Claude",
      "options": {
        "apiKey": "sk-你的密钥"
      },
      "models": {
        "claude-opus-4-6": {
          "id": "claude-opus-4-6",
          "name": "Claude Opus 4.6",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "modalities": {
            "input": [
              "text",
              "image",
              "pdf"
            ],
            "output": [
              "text"
            ]
          },
          "cost": {
            "input": 5,
            "output": 25,
            "cache_read": 0.5,
            "cache_write": 10
          },
          "limit": {
            "context": 200000,
            "output": 128000
          }
        },
        "claude-sonnet-4-6": {
          "id": "claude-sonnet-4-6",
          "name": "Claude Sonnet 4.6",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "modalities": {
            "input": [
              "text",
              "image",
              "pdf"
            ],
            "output": [
              "text"
            ]
          },
          "cost": {
            "input": 3,
            "output": 15,
            "cache_read": 0.3,
            "cache_write": 6
          },
          "limit": {
            "context": 200000,
            "output": 128000
          }
        },
        "claude-haiku-4-5": {
          "id": "claude-haiku-4-5-20251001",
          "name": "Claude Haiku 4.5",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "modalities": {
            "input": [
              "text",
              "image",
              "pdf"
            ],
            "output": [
              "text"
            ]
          },
          "cost": {
            "input": 1.1,
            "output": 5.5,
            "cache_read": 0.11,
            "cache_write": 2.2
          },
          "limit": {
            "context": 200000,
            "output": 64000
          }
        }
      }
    },
    "hone-openai": {
      "id": "hone-openai",
      "npm": "@ai-sdk/openai",
      "api": "https://hone.vvvv.ee/v1",
      "name": "HONE OpenAI",
      "options": {
        "apiKey": "sk-你的密钥"
      },
      "models": {
        "gpt-5.3-codex": {
          "id": "gpt-5.3-codex",
          "name": "GPT-5.3 Codex",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "modalities": {
            "input": [
              "text",
              "image",
              "pdf"
            ],
            "output": [
              "text"
            ]
          },
          "cost": {
            "input": 1.75,
            "output": 14,
            "cache_read": 0.17
          },
          "limit": {
            "context": 400000,
            "output": 128000
          }
        },
        "gpt-5.4": {
          "id": "gpt-5.4",
          "name": "GPT-5.4",
          "attachment": true,
          "reasoning": true,
          "tool_call": true,
          "modalities": {
            "input": [
              "text",
              "image"
            ],
            "output": [
              "text"
            ]
          },
          "cost": {
            "input": 2.5,
            "output": 15,
            "cache_read": 0.25
          },
          "limit": {
            "context": 1000000,
            "output": 128000
          }
        }
      }
    }
  }
}
```

oh-my-opencode.jsonc
```jsonc
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/dev/assets/oh-my-opencode.schema.json",

  // ==========================================
  // 1. Agents 核心配置 (根据你的精确要求)
  // ==========================================
  "agents": {
    // ---- Claude 统治区 (指令遵循) ----
    "sisyphus": {
      "model": "hone-claude/claude-opus-4-6",
      "variant": "max",
      "ultrawork": { "model": "hone-claude/claude-opus-4-6", "variant": "max" }
    },
    "metis": {
      "model": "hone-claude/claude-opus-4-6",
      "variant": "max"
    },

    // ---- 战略规划与编排区 (双流派) ----
    "prometheus": {
      "model": "hone-claude/claude-opus-4-6",
      "variant": "max"
    },
    "atlas": {
      "model": "hone-claude/claude-sonnet-4-6",
      "variant": "max"
    },

    // ---- 深度编码与核实区 (GPT 统治区) ----
    "hephaestus": {
      "model": "hone-openai/gpt-5.3-codex",
      "variant": "medium"
    },
    "oracle": {
      "model": "hone-openai/gpt-5.4",
      "variant": "high"
    },
    "momus": {
      "model": "hone-openai/gpt-5.4",
      "variant": "high"
    },

    // ---- 效用与多模态区 ----
    "explore": {
      "model": "hone-claude/claude-sonnet-4-6"
    },
    "librarian": {
      "model": "hone-claude/claude-sonnet-4-6"
    },
    "multimodal-looker": {
      "model": "hone-claude/claude-opus-4-6",
      "variant": "max"
    }
  },

  // ==========================================
  // 2. Categories 类别配置
  // (必须配置！这是 Sisyphus 自动下发子任务时的模型池)
  // ==========================================
  "categories": {
    "visual-engineering": {
      "model": "hone-openai/gpt-5.3-codex",
      "variant": "xhigh"
    },
    "ultrabrain": {
      "model": "hone-openai/gpt-5.3-codex",
      "variant": "xhigh"
    },
    "deep": {
      "model": "hone-openai/gpt-5.3-codex",
      "variant": "medium"
    },
    "artistry": {
      "model": "hone-openai/gpt-5.3-codex",
      "variant": "xhigh"
    },
    "quick": {
      "model": "hone-claude/claude-haiku-4-5"
    },
    "unspecified-low": {
      "model": "hone-claude/claude-sonnet-4-6"
    },
    "unspecified-high": {
      "model": "hone-openai/gpt-5.4",
      "variant": "high"
    },
    "writing": {
      "model": "hone-claude/claude-sonnet-4-6"
    }
  },

  // ==========================================
  // 3. 背景任务与并发限制
  // (强烈建议配置，避免多 Agent 狂暴运行直接刷爆账单或触发 API 墙)
  // ==========================================
  "background_task": {
    "defaultConcurrency": 5, // 全局最多跑 5 个并发
    "staleTimeoutMs": 180000,
    "providerConcurrency": {
      "hone-claude": 3,
      "hone-openai": 3
    }
  },

  // ==========================================
  // 4. Sisyphus 任务系统 & 高级特性开关
  // ==========================================
   "sisyphus_agent": {
    "disabled": false,
    "default_builder_enabled": false,
    "planner_enabled": true,
    "replace_plan": true
  },

  "sisyphus": {
    "tasks": {
      "enabled": true, // 开启强力的跨会话任务追踪
      "storage_path": ".sisyphus/tasks"
    }
  },

  // 备用模型故障自动转移 (极力推荐)
  "runtime_fallback": {
    "enabled": true,
    "max_fallback_attempts": 3,
    "cooldown_seconds": 60,
    "notify_on_fallback": true
  },

  // 是否在 Tmux 新面板里弹出子任务观察其输出（如果你不用 Tmux 可设为 false）
  "tmux": {
    "enabled": false
  },

  // 实验性特性提升上下文利用率
  "experimental": {
    "aggressive_truncation": true,
    "task_system": true,
    "dynamic_context_pruning": {
      "enabled": true,
      "turn_protection": { "enabled": true, "turns": 3 }
    }
  }
}

```

之后打开 WezTerm 终端，启动WSL并输入“opencode”，就可以愉快的使用了！

---

> 作者: [Francis Fu](https://francisfu.com/)  
> URL: https://francisfu.com/posts/opencode%E5%AE%89%E8%A3%85%E5%8F%8A%E9%85%8D%E7%BD%AE/opencode%E5%AE%89%E8%A3%85%E5%8F%8A%E9%85%8D%E7%BD%AE/  

