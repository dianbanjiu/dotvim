return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        -- 命令行居中弹窗
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          opts = {},
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
            lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
          },
        },
        -- 消息使用 notify 样式
        messages = {
          enabled = true,
          view = "mini",
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
        -- 通知统一使用 nvim-notify
        notify = {
          enabled = true,
          view = "notify",
        },
        -- LSP 文档提示现代化
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = { enabled = true },
          signature = { enabled = true },
          message = {
            enabled = true,
            view = "notify",
            opts = {},
          },
          documentation = {
            view = "hover",
            opts = {
              lang = "markdown",
              replace = true,
              render = "plain",
              format = { "{message}" },
              win_options = { concealcursor = "n", conceallevel = 3 },
            },
          },
        },
        -- 预设：命令面板、浮动搜索、长消息分屏、LSP 文档边框
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        -- 视图布局微调
        views = {
          cmdline_popup = {
            position = {
              row = "25%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
          },
          cmdline_popupmenu = {
            relative = "editor",
            position = "auto",
            size = {
              width = 60,
              height = "auto",
              max_height = 15,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "NoiceCmdlinePopupBorder",
                CursorLine = "NoicePopupmenuSelected",
                PmenuMatch = "NoicePopupmenuMatch",
              },
            },
          },
          hover = {
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            position = { row = 2, col = 2 },
          },
          confirm = {
            border = {
              style = "rounded",
              padding = { 0, 1 },
              text = { top = " Confirm " },
            },
          },
        },
        -- 路由规则
        routes = {
          -- 将写入/撤销等短消息降为 mini
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = "%d+L, %d+B",
            },
            view = "mini",
          },
          {
            filter = {
              event = "msg_show",
              find = "^%d+ more lines",
            },
            view = "mini",
          },
          {
            filter = {
              event = "msg_show",
              find = "^%d+ fewer lines",
            },
            view = "mini",
          },
          -- 搜索计数显示在虚拟文本中
          {
            filter = {
              event = "msg_show",
              kind = "search_count",
            },
            opts = { skip = true },
          },
        },
      }

      -- nvim-notify 样式配置
      require("notify").setup {
        stages = "fade_in_slide_out",
        timeout = 3000,
        max_width = 60,
        max_height = 15,
        render = "compact",
        background_colour = "#1e1e2e",
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      }
    end,
  },
}
