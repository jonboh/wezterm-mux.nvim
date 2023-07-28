function wezterm_cli_move(direction)
    vim.fn.system("wezterm cli activate-pane-direction "..direction)
end

function tabpage_dimensions()
    local windows = vim.api.nvim_tabpage_list_wins(0)
    local total_width = 0
    local total_height = 0
    for _, win in ipairs(windows) do
        total_width = total_width + vim.api.nvim_win_get_width(win)
        total_height = total_height + vim.api.nvim_win_get_height(win)
    end
    return {total_height, total_width}
end

-- function is_left_pane()
--   local win_col = vim.api.nvim_win_get_position(0)[2]
--   -- Check if the current pane is at the left edge
--   if win_col == 0 then
--     return true
--   else
--       return false
--   end
-- end
-- function is_right_pane()
--   local win_width = vim.fn.winwidth(0)
--   local win_col = vim.api.nvim_win_get_position(0)[2]
--   local total_width = tabpage_dimensions()[2]
--   -- Check if the current pane is at the right edge
--   if win_col + win_width == total_width then
--     return true
--   else
--       return false
--   end
-- end
-- function is_top_pane()
--   local win_row = vim.api.nvim_win_get_position(0)[1]
--   -- Check if the current pane is at the top edge
--   if win_row == 0 then
--     return true
--   else
--       return false
--   end
-- end
-- function is_bottom_pane()
--   local win_height = vim.fn.winheight(0)
--   local win_row = vim.api.nvim_win_get_position(0)[1]
--   local total_height = tabpage_dimensions()[1]
--   -- Check if the current pane is at the bottom edge
--   print(win_row)
--   print(win_height)
--   print(total_height)
--   if win_row + win_height == total_height then
--     return true
--   else
--       return false
--   end
-- end
function wezterm_move_left()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd h]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Left")
    end
end

function wezterm_move_right()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd l]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Right")
    end
end

function wezterm_move_up()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd k]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Up")
    end
end

function wezterm_move_down()
    local prev_win = vim.api.nvim_get_current_win()
    vim.cmd([[wincmd j]])
    local current_win= vim.api.nvim_get_current_win()
    if prev_win == current_win then
         wezterm_cli_move("Down")
    end
end

vim.api.nvim_create_user_command("WeztermMoveLeft", wezterm_move_left, {})
vim.api.nvim_create_user_command("WeztermMoveRight", wezterm_move_right, {})
vim.api.nvim_create_user_command("WeztermMoveUp", wezterm_move_up, {})
vim.api.nvim_create_user_command("WeztermMoveDown", wezterm_move_down, {})

