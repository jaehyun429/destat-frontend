import { useAccount, useReadContract } from "wagmi";
import { Link } from "react-router";
import {
  Card,
  CardHeader,
  CardTitle,
  CardDescription,
  CardContent,
} from "~/components/ui/card";
import { Button } from "~/components/ui/button";
import { CalendarIcon, CheckCircle2Icon } from "lucide-react";
import { useEffect, useState } from "react";
import { SURVEY_ABI } from "../constant";

interface ResponseData {
  surveyId: string;
  title: string;
  description: string;
  answers: number[];
  timestamp: Date;
}

export default function MyResponse() {
  const { address } = useAccount();
  const [responses, setResponses] = useState<ResponseData[]>([]);

  
  useEffect(() => {
    if (!address) return;
    
    const mockData: ResponseData[] = [
      {
        surveyId: "0x123...",
        title: "고객 만족도 조사",
        description: "우리 서비스에 대한 전반적인 만족도 조사입니다.",
        answers: [4, 3, 5, 4, 3, 4, 5, 4, 3, 5],
        timestamp: new Date("2025-01-10"),
      },
      {
        surveyId: "0x456...",
        title: "제품 사용성 테스트",
        description: "신규 제품의 사용성에 대한 피드백을 받고 있습니다.",
        answers: [3, 4, 4, 3, 4],
        timestamp: new Date("2025-01-08"),
      },
    ];
    setResponses(mockData);
  }, [address]);

  if (!address) {
    return (
      <div className="flex flex-col items-center justify-center h-[70vh]">
        <div className="text-center space-y-4">
          <h2 className="text-2xl font-bold">지갑을 연결해주세요</h2>
          <p className="text-gray-500">
            응답 내역을 확인하려면 지갑 연결이 필요합니다.
          </p>
        </div>
      </div>
    );
  }

  if (responses.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center h-[70vh]">
        <div className="text-center space-y-4">
          <CheckCircle2Icon className="w-16 h-16 mx-auto text-gray-300" />
          <h2 className="text-2xl font-bold">아직 응답한 설문이 없습니다</h2>
          <p className="text-gray-500">
            설문에 참여하고 보상을 받아보세요!
          </p>
          <Link to="/">
            <Button>설문 둘러보기</Button>
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="container mx-auto py-8">
      <div className="mb-8">
        <h1 className="text-3xl font-bold mb-2">내 응답 내역</h1>
        <p className="text-gray-500">
          총 {responses.length}개의 설문에 참여하셨습니다.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {responses.map((response, index) => (
          <Card key={index} className="hover:shadow-lg transition-shadow">
            <CardHeader>
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <CardTitle className="text-xl mb-2">
                    {response.title}
                  </CardTitle>
                  <CardDescription className="line-clamp-2">
                    {response.description}
                  </CardDescription>
                </div>
                <CheckCircle2Icon className="w-6 h-6 text-green-500 flex-shrink-0 ml-2" />
              </div>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                <div className="flex items-center text-sm text-gray-500">
                  <CalendarIcon className="w-4 h-4 mr-2" />
                  {response.timestamp.toLocaleDateString("ko-KR")}
                </div>
                
                <div className="text-sm">
                  <span className="font-semibold">응답 수:</span>{" "}
                  {response.answers.length}개 질문
                </div>

                <Link to={`/survey/${response.surveyId}`}>
                  <Button variant="outline" className="w-full">
                    설문 다시보기
                  </Button>
                </Link>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}