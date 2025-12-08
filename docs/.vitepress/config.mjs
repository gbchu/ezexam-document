import { defineConfig } from "vitepress";
export default defineConfig({
  lang: "zh-CN",
  title: "ezexam",
  description:
    "An typst exam and handouts template inspired by latex package exam-zh",
  head: [
    [
      "link",
      {
        rel: "icon",
        type: "image/svg+xml",
        href: "/logo.svg",
      },
    ],
  ],
  themeConfig: {
    logo: "/logo.svg",
    nav: [
      {
        text: "0.2.7 beta",
        items: [
          {
            text: "更新日志",
            link: "https://github.com/gbchu/ezexam/blob/main/README.md#changelog",
          },
          {
            text: "bug反馈",
            link: "https://github.com/gbchu/ezexam/issues/new",
          },
        ],
      },
    ],

    sidebar: [
      {
        text: "指南",
        items: [
          { text: "简介", link: "/about.md" },
          { text: "快速开始", link: "/usage.md" },
          { text: "完整模板示例", link: "/template.md" },
        ],
      },
      {
        text: "参考",
        link: "/reference.md",
        items: [
          {
            text: "全局设置",
            link: "/reference/setup.md",
            collapsed: true,
            items: [
              { text: "mode", link: "/reference/setup.md#mode" },
              { text: "paper", link: "/reference/setup.md#paper" },
              {
                text: "page-numbering",
                link: "/reference/setup.md#page-numbering",
              },
              { text: "page-align", link: "/reference/setup.md#page-align" },
              {
                text: "footer-is-separate",
                link: "/reference/setup.md#footer-is-separate",
              },
              {
                text: "outline-page-numbering",
                link: "/reference/setup.md#outline-page-numbering",
              },
              {
                text: "show-gap-line",
                link: "/reference/setup.md#show-gap-line",
              },
              {
                text: "font-size",
                link: "/reference/setup.md#font-size",
              },
              {
                text: "font",
                link: "/reference/setup.md#font",
              },
              {
                text: "font-math",
                link: "/reference/setup.md#font-math",
              },
              {
                text: "line-height",
                link: "/reference/setup.md#line-height",
              },
              {
                text: "par-spacing",
                link: "/reference/setup.md#par-spacing",
              },
              {
                text: "first-line-indent",
                link: "/reference/setup.md#first-line-indent",
              },
              {
                text: "heading-numbering",
                link: "/reference/setup.md#heading-numbering",
              },
              {
                text: "heading-hanging-indent",
                link: "/reference/setup.md#heading-hanging-indent",
              },
              {
                text: "heading-font",
                link: "/reference/setup.md#heading-font",
              },
              {
                text: "h1-size",
                link: "/reference/setup.md#h1-size",
              },
              {
                text: "heading-color",
                link: "/reference/setup.md#heading-color",
              },
              {
                text: "heading-top",
                link: "/reference/setup.md#heading-top",
              },
              {
                text: "heading-bottom",
                link: "/reference/setup.md#heading-bottom",
              },
              {
                text: "enum-numbering",
                link: "/reference/setup.md#enum-numbering",
              },
              {
                text: "enum-spacing",
                link: "/reference/setup.md#enum-spacing",
              },
              {
                text: "enum-indent",
                link: "/reference/setup.md#enum-indent",
              },
              {
                text: "watermark",
                link: "/reference/setup.md#watermark",
              },
              {
                text: "watermark-color",
                link: "/reference/setup.md#watermark-color",
              },
              {
                text: "watermark-font",
                link: "/reference/setup.md#watermark-font",
              },
              {
                text: "watermark-rotate",
                link: "/reference/setup.md#watermark-rotate",
              },
              {
                text: "show-answer",
                link: "/reference/setup.md#show-answer",
              },
              {
                text: "answer-color",
                link: "/reference/setup.md#answer-color",
              },
              {
                text: "show-seal-line",
                link: "/reference/setup.md#show-seal-line",
              },
              {
                text: "seal-line-student-info",
                link: "/reference/setup.md#seal-line-student-info",
              },
              {
                text: "seal-line-type",
                link: "/reference/setup.md#seal-line-type",
              },
              {
                text: "seal-line-supplement",
                link: "/reference/setup.md#seal-line-supplement",
              },
            ],
          },
          {
            text: "封面",
            link: "/reference/cover.md",
            collapsed: true,
            items: [
              { text: "title", link: "/reference/title.md#title" },
              { text: "subtitle", link: "/reference/title.md#subtitle" },
              { text: "author", link: "/reference/title.md#author" },
              { text: "date", link: "/reference/title.md#date" },
            ],
          },
          { text: "章节", link: "/reference/chapter.md" },
          {
            text: "标题",
            link: "/reference/title.md",
            collapsed: true,
            items: [
              { text: "body", link: "/reference/title.md#body" },
              { text: "font", link: "/reference/title.md#font" },
              { text: "size", link: "/reference/title.md#size" },
              { text: "weight", link: "/reference/title.md#weight" },
              { text: "position", link: "/reference/title.md#position" },
              { text: "top", link: "/reference/title.md#top" },
              { text: "bottom", link: "/reference/title.md#bottom" },
            ],
          },
          {
            text: "科目",
            link: "/reference/subject.md",
            collapsed: true,
            items: [
              { text: "body", link: "/reference/subject.md#body" },
              { text: "font", link: "/reference/subject.md#font" },
              { text: "size", link: "/reference/subject.md#size" },
              { text: "spacing", link: "/reference/subject.md#spacing" },
              { text: "top", link: "/reference/subject.md#top" },
              { text: "bottom", link: "/reference/subject.md#bottom" },
            ],
          },
          { text: "密级", link: "/reference/secret.md" },
          {
            text: "试卷类型",
            link: "/reference/exam-type.md",
            collapsed: true,
            items: [
              { text: "type", link: "/reference/exam-type.md#type" },
              { text: "prefix", link: "/reference/exam-type.md#prefix" },
            ],
          },
          {
            text: "试卷信息",
            link: "/reference/exam-info.md",
            collapsed: true,
            items: [
              { text: "info", link: "/reference/exam-type.md#info" },
              { text: "font", link: "/reference/exam-type.md#font" },
              { text: "size", link: "/reference/exam-type.md#size" },
              { text: "weight", link: "/reference/exam-type.md#weight" },
              { text: "gap", link: "/reference/exam-type.md#gap" },
              { text: "top", link: "/reference/exam-type.md#top" },
              { text: "bottom", link: "/reference/exam-type.md#bottom" },
            ],
          },
          {
            text: "评分框",
            link: "/reference/score_box.md",
            collapsed: true,
            items: [
              {
                text: "带阅卷人",
                link: "/reference/scoring-box.md",
                collapsed: true,
                items: [
                  { text: "x", link: "/reference/scoring-box.md#x" },
                  { text: "y", link: "/reference/scoring-box.md#y" },
                ],
              },
              {
                text: "不带阅卷人",
                link: "/reference/score-box.md",
                collapsed: true,
                items: [
                  { text: "x", link: "/reference/score-box.md#x" },
                  { text: "y", link: "/reference/score-box.md#y" },
                ],
              },
            ],
          },
          {
            text: "试卷的注意事项",
            link: "/reference/notice.md",
            collapsed: true,
            items: [
              { text: "format", link: "/reference/notice.md#format" },
              { text: "indent", link: "/reference/notice.md#indent" },
              {
                text: "hanging-indent",
                link: "/reference/notice.md#hanging-indent",
              },
              { text: "children", link: "/reference/notice.md#children" },
            ],
          },
          {
            text: "题目",
            link: "/reference/question.md",
            collapsed: true,
            items: [
              {
                text: "body-indent",
                link: "/reference/question.md#body-indent",
              },
              { text: "indent", link: "/reference/question.md#indent" },
              { text: "label", link: "/reference/question.md#label" },
              {
                text: "label-color",
                link: "/reference/question.md#label-color",
              },
              {
                text: "label-weight",
                link: "/reference/question.md#label-weight",
              },
              { text: "points", link: "/reference/question.md#points" },
              {
                text: "points-separate",
                link: "/reference/question.md#points-separate",
              },
              {
                text: "points-prefix",
                link: "/reference/question.md#points-prefix",
              },
              {
                text: "points-suffix",
                link: "/reference/question.md#points-suffix",
              },
              { text: "top", link: "/reference/question.md#top" },
              { text: "bottom", link: "/reference/question.md#bottom" },
              {
                text: "padding-top",
                link: "/reference/question.md#padding-top",
              },
              {
                text: "padding-bottom",
                link: "/reference/question.md#padding-bottom",
              },
              {
                text: "with-heading-label",
                link: "/reference/question.md#with-heading-label",
              },
              { text: "body", link: "/reference/question.md#body" },
            ],
          },
          {
            text: "选择题",
            link: "/reference/choices.md",
            collapsed: true,
            items: [
              { text: "columns", link: "/reference/choices.md#columns" },
              { text: "c-gap", link: "/reference/choices.md#c-gap" },
              { text: "r-gap", link: "/reference/choices.md#r-gap" },
              { text: "indent", link: "/reference/choices.md#indent" },
              { text: "sapcing", link: "/reference/choices.md#sapcing" },
              { text: "top", link: "/reference/choices.md#top" },
              { text: "bottom", link: "/reference/choices.md#bottom" },
              { text: "label", link: "/reference/choices.md#label" },
              { text: "label-position", link: "/reference/choices.md#label-position" },
              { text: "options", link: "/reference/choices.md#options" },
            ],
          },
          {
            text: "选择、判断的小括号",
            link: "/reference/paren.md",
            collapsed: true,
            items: [
              { text: "justify", link: "/reference/paren.md#justify" },
              { text: "placeholder", link: "/reference/paren.md#placeholder" },
              { text: "with-number", link: "/reference/paren.md#with-number" },
              { text: "update", link: "/reference/paren.md#update" },
              { text: "answer", link: "/reference/paren.md#answer" },
            ],
          },
          {
            text: "填空的线",
            link: "/reference/fillin.md",
            collapsed: true,
            items: [
              { text: "len", link: "/reference/fillin.md#len" },
              { text: "placeholder", link: "/reference/fillin.md#placeholder" },
              { text: "with-number", link: "/reference/fillin.md#with-number" },
              { text: "update", link: "/reference/fillin.md#update" },
              { text: "stroke", link: "/reference/fillin.md#stroke" },
              { text: "offset", link: "/reference/fillin.md#offset" },
              { text: "answer", link: "/reference/fillin.md#answer" },
            ],
          },
          {
            text: "着重号",
            link: "/reference/underdot.md",
            collapsed: true,
            items: [{ text: "body", link: "/reference/underdot.md#body" }],
          },
          {
            text: "图文混排",
            link: "/reference/text-figure.md",
            collapsed: true,
            items: [
              { text: "text", link: "/reference/text-figure.md#text" },
              { text: "figure", link: "/reference/text-figure.md#figure" },
              { text: "figure-x", link: "/reference/text-figure.md#figure-x" },
              { text: "figure-y", link: "/reference/text-figure.md#figure-y" },
              { text: "style", link: "/reference/text-figure.md#style" },
              { text: "gap", link: "/reference/text-figure.md#gap" },
              { text: "align", link: "/reference/text-figure.md#align" },
              { text: "top", link: "/reference/text-figure.md#top" },
              { text: "bottom", link: "/reference/text-figure.md#bottom" },
            ],
          },
          {
            text: "答案及解析",
            link: "/reference/answer-solution.md",
            collapsed: true,
            items: [
              {
                text: "答案",
                link: "/reference/answer.md",
                collapsed: true,
                items: [
                  { text: "color", link: "/reference/answer.md#color" },
                  { text: "body", link: "/reference/answer.md#body" },
                ],
              },
              {
                text: "解析",
                link: "/reference/solution.md",
                collapsed: true,
                items: [
                  { text: "title", link: "/reference/solution.md#title" },
                  { text: "title-size", link: "/reference/solution.md#title-size" },
                  {
                    text: "title-weight",
                    link: "/reference/solution.md#title-weight",
                  },
                  {
                    text: "title-color",
                    link: "/reference/solution.md#title-color",
                  },
                  {
                    text: "title-bg-color",
                    link: "/reference/solution.md#title-bg-color",
                  },
                  {
                    text: "title-radius",
                    link: "/reference/solution.md#title-radius",
                  },
                  {
                    text: "title-align",
                    link: "/reference/solution.md#title-align",
                  },
                  { text: "title-x", link: "/reference/solution.md#title-x" },
                  { text: "title-y", link: "/reference/solution.md#title-y" },
                  {
                    text: "border-style",
                    link: "/reference/solution.md#border-style",
                  },
                  {
                    text: "border-width",
                    link: "/reference/solution.md#border-width",
                  },
                  {
                    text: "border-color",
                    link: "/reference/solution.md#border-color",
                  },
                  { text: "color", link: "/reference/solution.md#color" },
                  { text: "radius", link: "/reference/solution.md#radius" },
                  { text: "inset", link: "/reference/solution.md#inset" },
                  { text: "breakable", link: "/reference/solution.md#breakable" },
                  { text: "top", link: "/reference/solution.md#top" },
                  { text: "bottom", link: "/reference/solution.md#bottom" },
                  {
                    text: "padding-top",
                    link: "/reference/solution.md#padding-top",
                  },
                  {
                    text: "padding-bottom",
                    link: "/reference/solution.md#padding-bottom",
                  },
                  { text: "body", link: "/reference/solution.md#body" },
                ],
              },
              {
                text: "解析内的评分",
                link: "/reference/score.md",
                collapsed: true,
                items: [
                  {
                    text: "score-prefix",
                    link: "/reference/score.md#score-prefix",
                  },
                  {
                    text: "score-suffix",
                    link: "/reference/score.md#score-suffix",
                  },
                  { text: "color", link: "/reference/score.md#color" },
                  { text: "points", link: "/reference/score.md#points" },
                ],
              },

            ],
          },
          {
            text: "草稿纸",
            link: "/reference/draft.md",
            collapsed: true,
            items: [
              { text: "name", link: "/reference/draft.md#name" },
              {
                text: "student-info",
                link: "/reference/draft.md#student-info",
              },
              { text: "dash", link: "/reference/draft.md#dash" },
              { text: "supplement", link: "/reference/draft.md#supplement" },
            ],
          },
          {
            text: "一种页码格式",
            link: "/reference/zh-arabic.md",
            collapsed: true,
            items: [
              { text: "prefix", link: "/reference/zh-arabic.md#prefix" },
              { text: "suffix", link: "/reference/zh-arabic.md#suffix" },
            ],
          },
          {
            text: "方格",
            link: "/reference/inline-square.md",
            collapsed: true,
            items: [
              { text: "num", link: "/reference/inline-square.md#num" },
              { text: "width", link: "/reference/inline-square.md#width" },
              { text: "gap", link: "/reference/inline-square.md#gap" },
              { text: "body", link: "/reference/inline-square.md#body" },
            ],
          },
          {
            text: "彩色盒子",
            link: "/reference/color-box.md",
            collapsed: true,
            items: [
              { text: "color", link: "/reference/color-box.md#color" },
              { text: "dash", link: "/reference/color-box.md#dash" },
              { text: "radius", link: "/reference/color-box.md#radius" },
              { text: "body", link: "/reference/color-box.md#body" },
            ],
          },
          {
            text: "彩色标记",
            link: "/reference/tag.md",
            collapsed: true,
            items: [
              { text: "color", link: "/reference/tag.md#color" },
              { text: "font", link: "/reference/tag.md#font" },
              { text: "prefix", link: "/reference/tag.md#prefix" },
              { text: "suffix", link: "/reference/tag.md#suffix" },
              { text: "body", link: "/reference/tag.md#body" },
            ],
          },
          {
            text: "多选标记",
            link: "/reference/multi.md",
          },
          {
            text: "化学相关",
            link: "/reference/chemistry/ezchem.md",
            collapsed: true,
            items: [
              { text: "单、双线桥", link: "/reference/chemistry/e-bridge.md" },
              { text: "离子、原子结构式", link: "/reference/chemistry/ai-struct.md" },
            ],
          },
        ],
      },
      {
        text: "小贴士",
        link: "/tips.md",
        collapsed: true,
        items: [{ text: "方法的全局配置", link: "/tips.md#方法的全局配置" }],
      },
    ],

    socialLinks: [
      { icon: "github", link: "https://github.com/gbchu/ezexam.git" },
    ],

    search: {
      provider: "local",
    },

    footer: {
      message: "Released under the MIT License.",
      copyright: "Copyright © 2025-present gbchu",
    },
/*
    lastUpdated: {
      text: "最后更新于",
    }, */

    /*     editLink: {
      pattern: "https://github.com/gbchu/ezexam-document",
      text: "在 GitHub 上编辑此页面",
    }, */
  },

  cleanUrls: true,
});
