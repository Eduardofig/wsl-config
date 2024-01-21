-- change default mapping
vim.g.vrc_set_default_mapping = 0
-- set the default response content type
vim.g.vrc_response_default_content_type = "application/json"
-- set the output buffer name
vim.g.vrc_output_buffer_name = "_OUTPUT.json"
-- Run a format command on the response buffer
vim.g.vrc_auto_format_response_patterns = {
    json = 'jq'
}
