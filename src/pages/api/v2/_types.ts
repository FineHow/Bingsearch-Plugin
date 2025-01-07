export interface Settings {
  BING_API_KEY: string;
}

export const settings: Settings = {
  BING_API_KEY: process.env.BING_API_KEY || "default_api_key", // 如果没有设置环境变量，使用默认值
};
