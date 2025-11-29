return require("telescope").register_extension {
  exports = {
    java_creator = require("java_creator.telescope").setup().java_creator,
  },
}
