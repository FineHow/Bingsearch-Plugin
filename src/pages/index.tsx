import { useEffect, useState } from 'react';

const Render = () => {
  const [data, setData] = useState<any>(null);

  useEffect(() => {
    // 使用 fetch 请求加载 public/index.json 文件
    fetch('/index.json')
      .then((response) => response.json())
      .then((jsonData) => {
        setData(jsonData);  // 设置获取到的数据
      })
      .catch((error) => {
        console.error('Failed to load JSON:', error);
      });
  }, []);

  // 如果数据还在加载，显示加载提示
  if (!data) {
    return <div>正在加载中...</div>;
  }

  
  return (
        <div>
          <pre>{JSON.stringify(data, null, 2)}</pre>
        </div>
  );
};

export default Render;


  