--- nvim tree ---
--- nvim打开目录时在侧边栏打开
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local argv = vim.fn.argv()
        -- 确保只有一个参数（即打开了一个文件或目录）
        if #argv ~= 1 then
            return
        end

        local path = argv[1]

        -- 排除以 '-' 开头的参数（通常是命令行选项，如 -c, -S 等）
        if path:sub(1, 1) == "-" then
            return
        end

        -- 检查参数是否为一个目录
        if vim.fn.isdirectory(path) == 1 then
            -- 1. 切换到传入的目录
            vim.cmd.cd(path)

            -- 2. 关键步骤：清理 netrw/空 buffer
            --   - 如果 Neovim 默认打开了 netrw（目录列表），这条命令会关闭它，
            --     并创建一个新的空 buffer (enew)，为 nvim-tree 腾出空间。
            --   - 如果已经打开了 netrw 目录，其 buffer 是唯一的，需要清理掉。
            --   - 备注：如果第一个 `VimEnter` 的逻辑是必要的（即清理 netrw），则保留 `enew`。
            --     如果你的 nvim-tree 配置能自动接管，可以省略这一行。这里为了兼容性保留。
            vim.cmd("enew")

            -- 3. 打开 nvim-tree
            require("nvim-tree.api").tree.open()
        end
    end
})

--- 关闭最后一个窗口时退出nvim
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
        end
    end,
})
