import { useWatchPluginMessage } from '@lobehub/chat-plugin-sdk/client';
import { memo } from 'react';
import { Flexbox } from 'react-layout-kit';
import { Card,Flex} from "antd";


const Render = memo(() => {
  const { data } = useWatchPluginMessage();
 return (
    <div>
      {/* Flexbox for displaying cards in rows */}
      {Array.isArray(data) && (
        <Flex  gap={12} justify='space-between' wrap="wrap" >
          {data.map((item, index) => (
            <Flexbox flex={1}  justify='space-between' key={index} >
              <Card
                bordered={true}
                style={{ height:"200px" }}
                title={<div 
                style={{
                  WebkitBoxOrient: 'vertical',
                  WebkitLineClamp: 1, // Limit to 3 lines
                  color:"#1677FF",
                  display: '-webkit-box',
                  fontSize:'16px',
                  marginTop:'4px',
                  overflow: 'hidden',
                }}>
                  <a href={item.link!}>{item.title}</a>
                  </div>}
              >
                <a  href={item.link!} rel="noreferrer" target="_blank">
                  <Flexbox distribution="space-between" flex={1} gap={5} >
                    <Flexbox
                      
                      style={{
                        WebkitBoxOrient: 'vertical',
                        WebkitLineClamp: 3, // Limit to 3 lines
                        color:"#adadad",
                        display: '-webkit-box',
                        overflow: 'hidden',
                      }}
                    >
                      {item.content}
                    </Flexbox>
                    <Flexbox style={{color:"#c8c8c8"}}>
                      {item.source ? `${item.source}` : `网络搜索结果`}
                    </Flexbox>
                  </Flexbox>
                </a>
              </Card>
            </Flexbox>
          ))}
        </Flex>
      )}
    </div>
  );
});

export default Render;



