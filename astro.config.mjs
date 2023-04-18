import { defineConfig } from "astro/config";

import rehypeKatex from "rehype-katex";
import remarkMath from "remark-math";
import mdx from "@astrojs/mdx";

// https://astro.build/config
export default defineConfig({
  markdown: {
    rehypePlugins: [rehypeKatex],
    remarkPlugins: [remarkMath],
    shikiConfig: {
      theme: "css-variables",
      wrap: true,
    },
  },
  outDir: "./docs",
});
