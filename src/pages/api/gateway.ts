import { createGatewayOnEdgeRuntime } from '@lobehub/chat-plugins-gateway';

export const config = {
  runtime: 'edge',
};

export default async (req: Request) => {
  return createGatewayOnEdgeRuntime()(req);
};

