import { defineConfig } from "astro/config";
import rehypeKatex from "rehype-katex";
import remarkMath from "remark-math";

import relativeLinks from "astro-relative-links";

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
  integrations: [relativeLinks()],
});
