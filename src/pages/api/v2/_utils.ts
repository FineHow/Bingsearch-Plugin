// import { Logo } from '@lobehub/ui';
import fetch from 'node-fetch';

import { Result, bingResults } from './type';
import { Settings } from './_types';

const BASE_URL = 'https://api.bing.microsoft.com/v7.0/search';

const fetchResult = async (args: { query: string }, settings: Settings): Promise<Result> => {
  const apiKey = settings.BING_API_KEY;
  const { default: querystring } = await import('query-string');
  console.log('APIKEY', apiKey);
  const params = {
    q: args.query,
    safeSearch:"Strict",

  };
  const query = querystring.stringify(params);
  if (!apiKey) {
    throw new Error('API key is missing');
  }

  const res = await fetch(`${BASE_URL}?${query}`, {
    headers: {
      'Ocp-Apim-Subscription-Key': apiKey,
    },
    method: 'GET',
  });
  if (!res.ok) {
    throw new Error(`Bing API request failed with status: ${res.status}`);
  }
  const data = await res.json();
  const results = data.webPages.value as bingResults;  
  const cc = results.map((info) => ({
    content: info.snippet,
    date: info.datePublished,
    // displayed_link: info.displayUrl ,
    link: info.url,
    source: info.siteName ,
    title: info.name,
  }));
  console.log('数据结构:', cc);
  return cc;
};

export default fetchResult;
