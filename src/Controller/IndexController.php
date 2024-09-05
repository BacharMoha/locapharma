<?php
namespace App\Controller;

use App\Entity\Notification;
use App\Entity\Pharmacie;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $pharmacie = $entityManager->getRepository(Pharmacie::class)->findAll();
        $notification = $entityManager->getRepository(Notification::class)->findAll();


        $query = $entityManager->createQuery(
            'SELECT COUNT(n.id) 
            FROM App\Entity\Notification n'
        );

        $notificationCount = $query->getSingleScalarResult();

        return $this->render('index/index.html.twig', [
            'pharmacie' => $pharmacie,
            'notification_count' => $notificationCount,
            'notifications' => $notification
        ]);
    }

    

    #[Route('/notif', name: 'app_notification')]
    public function notif(): Response
    {
        return $this->render('affichenotification.html.twig', [
            'controller_name' => 'IndexController',
        ]);
    }

    #[Route('/profil', name: 'app_profile')]
    public function profil(): Response
    {
        return $this->render('profile.html.twig', [
            'controller_name' => 'IndexController',
        ]);
    }
}
