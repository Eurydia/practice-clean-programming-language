import { defineConfig } from "astro/config";
import rehypeKatex from "rehype-katex";
import remarkMath from "remark-math";
import relativeLinks from "astro-relative-links";

import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  site: "https://eurydia.github.io",
  base: "/practice-concurrent-clean",
  markdown: {
    rehypePlugins: [rehypeKatex],
    remarkPlugins: [remarkMath],
    shikiConfig: {
      theme: "css-variables",
      wrap: false,
    },
  },
  integrations: [
    relativeLinks(),
    tailwind({ config: { applyBaseStyles: false } }),
  ],
});
