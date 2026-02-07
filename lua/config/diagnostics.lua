return {
  vim.diagnostic.config({
    virtual_text = {
      prefix = '●', -- Character that appears at the end of the line.
      source = "if_many", -- Show if the error come from rust_analyzer or clippy.
    },
    signs = true,         -- Show icons in the lateral column (gutter)
    underline = true,     -- Emphasize the code with errors.
    update_in_insert = false, -- No molesta mientras escribes (se actualiza al salir a modo normal)
    severity_sort = true, -- Prioriza mostrar errores sobre advertencias
  })

}
