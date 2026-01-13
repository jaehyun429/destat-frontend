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
import { SURVEY_ABI } from "../../survey/constant"; 
