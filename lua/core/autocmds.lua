--- 关闭最后一个窗口时退出nvim
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local wins = vim.api.nvim_list_wins()
        local real_wins = vim.tbl_filter(function(w)
            local buf = vim.api.nvim_win_get_buf(w)
            local ft = vim.bo[buf].filetype
            return ft ~= "snacks_layout_box"
        end, wins)
        if #real_wins == 0 then
            vim.cmd("quit")
        end
    end,
})
