return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        clangd = {},
        gopls = {},
        lua_ls = {},
        lsp_ai = {
          memory = {
            file_store = vim.empty_dict(),
          },
          models = {
            model1 = {
              type = "ollama",
              model = vim.g["ollama_model"],
              chat_endpoint = vim.g["ollama_url"] .. "/api/chat",
              generate_endpoint = vim.g["ollama_url"] .. "/api/generate",
            },
          },
          completion = {
            model = "model1",
            parameters = {
              max_context = 8192,
              messages = {
                {
                  role = "system",
                  content =
                  'Instructions:\n- You are an AI programming assistant.\n- Given a piece of code with the cursor location marked by "<CURSOR>", replace "<CURSOR>" with the correct code or comment.\n- First, think step-by-step.\n- Describe your plan for what to build in pseudocode, written out in great detail.\n- Then output the code replacing the "<CURSOR>"\n- Ensure that your completion fits within the language context of the provided code snippet (e.g., Python, JavaScript, Rust).\n\nRules:\n- Only respond with code or comments.\n- Only replace "<CURSOR>"; do not include any previously written code.\n- Never include "<CURSOR>" in your response\n- If the cursor is within a comment, complete the comment meaningfully.\n- Handle ambiguous cases by providing the most contextually appropriate completion.\n- Be consistent with your responses.',
                },
                {
                  role = "user",
                  content = 'def greet(name):\n    print(f"Hello, {<CURSOR>}")',
                },
                {
                  role = "assistant",
                  content = "name",
                },
                {
                  role = "user",
                  content = "function sum(a, b) {\n    return a + <CURSOR>;\n}",
                },
                { role = "assistant", content = "b" },

                { role = "user",      content = "fn multiply(a: i32, b: i32) -> i32 {\n    a * <CURSOR>\n}" },

                { role = "assistant", content = "b" },

                { role = "user",      content = "# <CURSOR>\ndef add(a, b):\n    return a + b" },

                { role = "assistant", content = "Adds two numbers" },

                { role = "user",      content = "# This function checks if a number is even\n<CURSOR>" },

                { role = "assistant", content = "def is_even(n):\n    return n % 2 == 0" },

                { role = "user",      content = "{CODE}" },
              },
            },
          },
        },
        markdown_oxide = {}, -- Markdown PKM
        marksman = {},       -- Markdown language server
        nixd = {},
        pylsp = {},
        svelte = {},
        taplo = {}, -- Toml language server
      },
    },
  },
}
