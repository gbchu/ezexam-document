import { defineConfig } from "vitepress";
export default defineConfig({
  lang: "zh-CN",
  title: "ezexam",
  description: "A typst template inspired by latex package exam-zh",
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
    sidebar: [
      {
        text: "指南",
        items: [
          { text: "简介", link: "/简介.md" },
          { text: "使用说明", link: "/使用说明.md" },
          {
            text: "方法及参数说明",
            collapsed: true,
            items: [
              {
                text: "setup",
                link: "/setup.md",
                collapsed: true,
                items: [
                  { text: "mode", link: "/setup.md#mode" },
                  { text: "paper", link: "/setup.md#paper" },
                  {
                    text: "page-numbering",
                    link: "/setup.md#page-numbering",
                  },
                  { text: "page-align", link: "/setup.md#page-align" },
                  {
                    text: "footer-is-separate",
                    link: "/setup.md#footer-is-separate",
                  },
                  {
                    text: "outline-page-numbering",
                    link: "/setup.md#outline-page-numbering",
                  },
                  {
                    text: "show-gap-line",
                    link: "/setup.md#show-gap-line",
                  },
                  {
                    text: "font-size",
                    link: "/setup.md#font-size",
                  },
                  {
                    text: "font",
                    link: "/setup.md#font",
                  },
                  {
                    text: "font-math",
                    link: "/setup.md#font-math",
                  },
                  {
                    text: "line-height",
                    link: "/setup.md#line-height",
                  },
                  {
                    text: "par-spacing",
                    link: "/setup.md#par-spacing",
                  },
                  {
                    text: "first-line-indent",
                    link: "/setup.md#first-line-indent",
                  },
                  {
                    text: "heading-font",
                    link: "/setup.md#heading-font",
                  },
                  {
                    text: "heading-size",
                    link: "/setup.md#heading-size",
                  },
                  {
                    text: "heading-color",
                    link: "/setup.md#heading-color",
                  },
                  {
                    text: "heading-top",
                    link: "/setup.md#heading-top",
                  },
                  {
                    text: "heading-bottom",
                    link: "/setup.md#heading-bottom",
                  },
                  {
                    text: "show-answer",
                    link: "/setup.md#show-answer",
                  },
                  {
                    text: "answer-color",
                    link: "/setup.md#answer-color",
                  },
                  {
                    text: "show-seal-line",
                    link: "/setup.md#show-seal-line",
                  },
                  {
                    text: "seal-line-student-info",
                    link: "/setup.md#seal-line-student-info",
                  },
                  {
                    text: "seal-line-type",
                    link: "/setup.md#seal-line-type",
                  },
                  {
                    text: "seal-line-supplement",
                    link: "/setup.md#seal-line-supplement",
                  },
                ],
              },
              { text: "chapter", link: "/chapter.md" },
              {
                text: "title",
                link: "/title.md",
                collapsed: true,
                items: [
                  { text: "name", link: "/title.md#name" },
                  { text: "font", link: "/title.md#font" },
                  { text: "size", link: "/title.md#size" },
                  { text: "weight", link: "/title.md#weight" },
                  { text: "position", link: "/title.md#position" },
                  { text: "top", link: "/title.md#top" },
                  { text: "bottom", link: "/title.md#bottom" },
                ],
              },
              {
                text: "subject",
                link: "/subject.md",
                collapsed: true,
                items: [
                  { text: "name", link: "/subject.md#name" },
                  { text: "font", link: "/subject.md#font" },
                  { text: "size", link: "/subject.md#size" },
                  { text: "spacing", link: "/subject.md#spacing" },
                  { text: "top", link: "/subject.md#top" },
                  { text: "bottom", link: "/subject.md#bottom" },
                ],
              },
              { text: "secret", link: "/secret.md" },
              {
                text: "exam-type",
                link: "/exam-type.md",
                collapsed: true,
                items: [
                  { text: "type", link: "/exam-type.md#type" },
                  { text: "prefix", link: "/exam-type.md#prefix" },
                ],
              },
              {
                text: "exam-info",
                link: "/exam-info.md",
                collapsed: true,
                items: [
                  { text: "info", link: "/exam-type.md#info" },
                  { text: "font", link: "/exam-type.md#font" },
                  { text: "size", link: "/exam-type.md#size" },
                  { text: "weight", link: "/exam-type.md#weight" },
                  { text: "gap", link: "/exam-type.md#gap" },
                  { text: "top", link: "/exam-type.md#top" },
                  { text: "bottom", link: "/exam-type.md#bottom" },
                ],
              },
              {
                text: "scoring-box",
                link: "/scoring-box.md",
                collapsed: true,
                items: [
                  { text: "x", link: "/scoring-box.md#x" },
                  { text: "y", link: "/scoring-box.md#y" },
                ],
              },
              {
                text: "score-box",
                link: "/score-box.md",
                collapsed: true,
                items: [
                  { text: "x", link: "/score-box.md#x" },
                  { text: "y", link: "/score-box.md#y" },
                ],
              },
              { text: "notice", link: "/notice.md" },
              {
                text: "zh-arabic",
                link: "/zh-arabic.md",
                collapsed: true,
                items: [
                  { text: "prefix", link: "/zh-arabic.md#prefix" },
                  { text: "suffix", link: "/zh-arabic.md#suffix" },
                ],
              },
              {
                text: "inline-square",
                link: "/inline-square.md",
                collapsed: true,
                items: [
                  { text: "num", link: "/inline-square.md#num" },
                  { text: "width", link: "/inline-square.md#width" },
                  { text: "gap", link: "/inline-square.md#gap" },
                  { text: "body", link: "/inline-square.md#body" },
                ],
              },
              {
                text: "draft",
                link: "/draft.md",
                collapsed: true,
                items: [
                  { text: "name", link: "/draft.md#name" },
                  { text: "student-info", link: "/draft.md#student-info" },
                  { text: "dash", link: "/draft.md#dash" },
                  { text: "supplement", link: "/draft.md#supplement" },
                ],
              },
              {
                text: "choices",
                link: "/choices.md",
                collapsed: true,
                items: [
                  { text: "column", link: "/choices.md#column" },
                  { text: "c-gap", link: "/choices.md#c-gap" },
                  { text: "r-gap", link: "/choices.md#r-gap" },
                  { text: "indent", link: "/choices.md#indent" },
                  { text: "body-indent", link: "/choices.md#body-indent" },
                  { text: "top", link: "/choices.md#top" },
                  { text: "bottom", link: "/choices.md#bottom" },
                  { text: "label", link: "/choices.md#label" },
                  { text: "options", link: "/choices.md#options" },
                ],
              },
              {
                text: "question",
                link: "/question.md",
                collapsed: true,
                items: [
                  { text: "body-indent", link: "/question.md#body-indent" },
                  { text: "indent", link: "/question.md#indent" },
                  { text: "line-height", link: "/question.md#line-height" },
                  { text: "label", link: "/question.md#label" },
                  { text: "label-color", link: "/question.md#label-color" },
                  { text: "label-weight", link: "/question.md#label-weight" },
                  { text: "points", link: "/question.md#points" },
                  {
                    text: "points-separate-par",
                    link: "/question.md#points-separate-par",
                  },
                  { text: "points-prefix", link: "/question.md#points-prefix" },
                  { text: "points-suffix", link: "/question.md#points-suffix" },
                  { text: "top", link: "/question.md#top" },
                  { text: "bottom", link: "/question.md#bottom" },
                  {
                    text: "with-heading-label",
                    link: "/question.md#with-heading-label",
                  },
                  { text: "body", link: "/question.md#body" },
                ],
              },
              {
                text: "paren",
                link: "/paren.md",
                collapsed: true,
                items: [
                  { text: "justify", link: "/paren.md#justify" },
                  { text: "placeholder", link: "/paren.md#placeholder" },
                  { text: "answer", link: "/paren.md#answer" },
                ],
              },
              {
                text: "fillin",
                link: "/fillin.md",
                collapsed: true,
                items: [
                  { text: "length", link: "/fillin.md#length" },
                  { text: "placeholder", link: "/fillin.md#placeholder" },
                  { text: "answer", link: "/fillin.md#answer" },
                ],
              },
              {
                text: "text-figure",
                link: "/text-figure.md",
                collapsed: true,
                items: [
                  { text: "text", link: "/text-figure.md#text" },
                  { text: "figure", link: "/text-figure.md#figure" },
                  { text: "figure-x", link: "/text-figure.md#figure-x" },
                  { text: "figure-y", link: "/text-figure.md#figure-y" },
                  { text: "top", link: "/text-figure.md#top" },
                  { text: "bottom", link: "/text-figure.md#bottom" },
                ],
              },
              {
                text: "explain",
                link: "/explain.md",
                collapsed: true,
                items: [
                  { text: "title", link: "/explain.md#title" },
                  { text: "title-size", link: "/explain.md#title-size" },
                  { text: "title-weight", link: "/explain.md#title-weight" },
                  { text: "title-color", link: "/explain.md#title-color" },
                  {
                    text: "title-bg-color",
                    link: "/explain.md#title-bg-color",
                  },
                  { text: "title-radius", link: "/explain.md#title-radius" },
                  { text: "title-align", link: "/explain.md#title-align" },
                  { text: "title-x", link: "/explain.md#title-x" },
                  { text: "title-y", link: "/explain.md#title-y" },
                  { text: "border-style", link: "/explain.md#border-style" },
                  { text: "border-width", link: "/explain.md#border-width" },
                  { text: "border-color", link: "/explain.md#border-color" },
                  { text: "color", link: "/explain.md#color" },
                  { text: "radius", link: "/explain.md#radius" },
                  { text: "inset", link: "/explain.md#inset" },
                  { text: "breakable", link: "/explain.md#breakable" },
                  { text: "above", link: "/explain.md#above" },
                  { text: "below", link: "/explain.md#below" },
                  { text: "body", link: "/explain.md#body" },
                ],
              },
              {
                text: "score",
                link: "/score.md",
                collapsed: true,
                items: [
                  { text: "score-prefix", link: "/score.md#score-prefix" },
                  { text: "score-suffix", link: "/score.md#score-suffix" },
                  { text: "color", link: "/score.md#color" },
                  { text: "points", link: "/score.md#points" },
                ],
              },
              {
                text: "color-box",
                link: "/color-box.md",
                collapsed: true,
                items: [
                  { text: "color", link: "/color-box.md#color" },
                  { text: "dash", link: "/color-box.md#dash" },
                  { text: "radius", link: "/color-box.md#radius" },
                  { text: "body", link: "/color-box.md#body" },
                ],
              },
              {
                text: "multi",
                link: "/multi.md",
              },
            ],
          },
          { text: "注意事项", link: "/注意事项.md" },
          { text: "完整模板示例", link: "/template.md" },
          { text: "bug反馈", link: "/bug.md" },
          { text: "更新日志", link: "/CHANGELOG.md" },
        ],
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

    lastUpdated: {
      text: 'Updated at',
      formatOptions: {
        dateStyle: 'full',
        timeStyle: 'medium'
      }
    },

    editLink: {
      pattern: 'https://github.com/gbchu/ezexam-document',
      text: '在 GitHub 上编辑此页面'
    }
  },

  cleanUrls: true,
});
