local M = {}

function wezterm_cli_move(direction)
    vim.fn.system("wezterm cli activate-pane-direction "..direction)
end

function M.wezterm_move_left()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd h]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Left")
    end
end

function M.wezterm_move_right()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd l]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Right")
    end
end

function M.wezterm_move_up()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd k]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Up")
    end
end

function M.wezterm_move_down()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd j]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Down")
    end
end

return M
