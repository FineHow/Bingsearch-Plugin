{
  "$schema": "../node_modules/@lobehub/chat-plugin-sdk/schema.json",
  "api": [
    {
      "name": "Bingsearch",
      "url": "https://bingsearch-plugin.vercel.app/api/v2",
      "description": "基于bing搜索引擎的互联网搜索",
      "parameters": {
        "properties": {
          "query": {
            "description": "搜索的文本内容",
            "type": "string"
          }
        },
        "required": ["query"],
        "type": "object"
      }
    }
  ],
  "settings": {
    "type": "object",
    "required": ["BING_API_KEY"],
    "properties": {
      "BING_API_KEY": {
        "title": "Bingsearch API Key",
        "description": "we use [Bingsearch](https://www.microsoft.com/en-us/bing/apis) as backend service | 该插件使用 Bingsearchapi 作为搜索服务",
        "type": "string",
        "minLength": 32,
        "maxLength": 32,
        "format": "password"
      }
    }
  },
  "ui": {
    "url": "http://bingsearch-plugin.vercel.app/ui",
    "height": 400
  },
  "author": "ZWL_FineHow",
  "createdAt": "2024-11-21",
  "homepage": "https://github.com/FineHow/Bingsearch-Plugin",
  "identifier": "Bingsearch-identifier",
  "meta": {
    "avatar": "🚀",
    "tags": ["Bingsearch"],
    "title": "Bing联网搜索",
    "description": "基于bing搜索引擎的互联网搜索助手"
  },
  "version": "1"
}
