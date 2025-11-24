return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  event = {
    "BufReadPre",
    "BufNewFile",
    "VeryLazy",
  },
  init = function()
    -- Minimal configuration that does not require the plugin to be loaded
    vim.g.webdevicons_enable = 1
    vim.g.webdevicons_enable_nerdtree = 0 -- Disable NERDTree integration
  end,
  config = function()
    local devicons = require "nvim-web-devicons"

    local config = {
      override = {
        ["pom.xml"] = { icon = "", name = "Maven" },
        ["package.json"] = { icon = "", name = "PackageJson" },
        ["package-lock.json"] = { icon = "", name = "PackageLockJson" },
        ["readme.md"] = { icon = "󰂺 ", name = "Readme" },
        ["readme"] = { icon = "󰂺", name = "Readme" },
        ps1 = { icon = " ", name = "PS1" },
        xml = { icon = "󰗀 ", name = "Xml" },
        sql = { icon = "", name = "SQL" },
        cs = { icon = " ", name = "Csharp" },
        c = { icon = "", name = "C" },
        css = { icon = "", name = "CSS" },
        csproj = { icon = "󰪮 ", name = "Csproj" },
        deb = { icon = "", name = "Deb" },
        Dockerfile = {
          icon = "",
          name = "Dockerfile",
        },
        md = { icon = " ", name = "Md" },
        astro = { icon = "󰑣", name = "SVELTE" },
        html = { icon = "", name = "HTML" },
        jpeg = { icon = " ", name = "JPEG" },
        jpg = { icon = " ", name = "JPG" },
        js = { icon = " ", name = "JS" },
        kt = { icon = "", name = "Kt" },
        lock = { icon = "󰌾", name = "Lock" },
        mp3 = { icon = "󰎈", name = "MP3" },
        mp4 = { icon = "", name = "MP4" },
        out = { icon = "", name = "Out" },
        png = { icon = "", name = "PNG" },
        py = { icon = "", name = "Py" },
        rust = { icon = "󱘗", name = "Rust" },
        ["robots.txt"] = {
          icon = "󱚣",
          name = "robots",
        },
        toml = { icon = "", name = "TOML" },
        ts = { icon = "󰛦", name = "TS" },
        ttf = {
          icon = "",
          name = "TrueTypeFont",
        },
        rb = { icon = "󰴭" },
        yuck = { icon = "󰇷", name = "Yuck" },
        vim = { icon = "", name = "Vim" },
        rpm = { icon = "", name = "RPM" },
        vue = { icon = "󰡄", name = "Vue" },
        woff = {
          icon = "",
          name = "WebOpenFontFormat",
        },
        woff2 = {
          icon = "",
          name = "WebOpenFontFormat2",
        },
        xz = { icon = "", name = "XZ" },
        zip = { icon = "", name = "Zip" },
      },
      default = true,
    }

    devicons.set_default_icon("󰈚", "#6d8086")
    devicons.setup(config)

    -- Preloading common icons for better performance
    vim.defer_fn(function()
      devicons.get_icon "init.lua"
      devicons.get_icon ".gitignore"
      devicons.get_icon "README.md"
    end, 50)
  end,
}
