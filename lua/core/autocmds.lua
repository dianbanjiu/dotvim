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

            -- 2. 关键步骤：清理 netrw/目录 buffer
            --   - `enew` 只是切换到新 buffer，旧 buffer 仍会残留。
            --   - netrw 的 filetype 在 VimEnter 时可能尚未设置，因此不能单靠 filetype 判断。
            --   - 通过 buffer name 判断是否为目录，再用 `bwipeout!` 彻底抹除，防止其出现在 bufferline 中。
            local old_buf = vim.api.nvim_get_current_buf()
            local old_name = vim.api.nvim_buf_get_name(old_buf)
            vim.cmd("enew")
            if vim.fn.isdirectory(old_name) == 1 or vim.bo[old_buf].filetype == "netrw" then
                pcall(vim.cmd, "bwipeout! " .. old_buf)
            end

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
