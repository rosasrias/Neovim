return {
  "apyra/nvim-unity-sync",
  ft = { "cs" }, -- lo cargamos solo en archivos C#
  cmd = { "UnitySync", "UnityBuild" }, -- comandos del plugin
  config = function()
    require("unity.plugin").setup()
  end,
}
